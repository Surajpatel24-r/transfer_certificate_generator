import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart' as dateshow;
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:transfer_certificate_generator/models/student.dart';
import 'package:transfer_certificate_generator/service/data_controller.dart';
import 'package:transfer_certificate_generator/service/data_store.dart';
import 'package:transfer_certificate_generator/templates/template_1.dart';
import 'package:transfer_certificate_generator/templates/template_2.dart';
import 'package:transfer_certificate_generator/templates/template_3.dart';

class AllFormScreen extends StatefulWidget {
  const AllFormScreen({Key? key}) : super(key: key);

  @override
  State<AllFormScreen> createState() => _AllFormScreenState();
}

class _AllFormScreenState extends State<AllFormScreen> {
  final _dataStore = DataStoreService();
  final _dataController = DataController(DataStoreService());

  final _formkey = GlobalKey<FormState>();

  final _tcNoController = TextEditingController();
  final _nameController = TextEditingController();
  final _fNameController = TextEditingController();
  final _mNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _dobController = TextEditingController();
  final _courseAndBranchController = TextEditingController();
  final _semStudentAdmittedController = TextEditingController();
  final _semStudentLeaveController = TextEditingController();
  final _rollNoController = TextEditingController();
  final _resultController = TextEditingController();
  final _reasonController = TextEditingController();
  final _conductController = TextEditingController();
  final _dateLeaveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
          leading: IconButton(
        icon: Icon(FluentIcons.back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      content: Container(
        width: 850,
        child: Form(
          key: _formkey,
          child: Stack(
            children: [
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5,
                    crossAxisSpacing: 20.0),
                children: [
                  TextFormBox(
                    controller: _tcNoController,
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return 'TC Nnumber is required';
                    },
                    header: "TC Number: ",
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      shape: BoxShape.rectangle,
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextFormBox(
                    controller: _nameController,
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return 'Please Enter a Name';
                    },
                    header: "Name of the Students: ",
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  TextFormBox(
                      controller: _fNameController,
                      header: "Father's Name: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Father Name';
                      }),
                  TextFormBox(
                      controller: _mNameController,
                      header: "Mother's Name: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Mother Name';
                      }),
                  TextFormBox(
                      controller: _genderController,
                      header: "Gender: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Gender';
                      }),
                  TextFormBox(
                    controller: _dobController,
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return 'Please Enter DOB';
                    },
                    header: "Date of birth as per record: ",
                    decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      shape: BoxShape.rectangle,
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await dateshow.showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          _dobController.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                  TextFormBox(
                      controller: _courseAndBranchController,
                      header:
                          "Course and Branch to which the student was admitted: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Course And Branch';
                      }),
                  TextFormBox(
                      controller: _semStudentAdmittedController,
                      header: "Semester to which the student was admitted: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Semester';
                      }),
                  TextFormBox(
                      controller: _semStudentLeaveController,
                      header:
                          "Semester in which the student was studying at the time of leaving: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Semester at the time of leaving';
                      }),
                  TextFormBox(
                      controller: _rollNoController,
                      header: "University Roll No/ Enrollment No: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Roll No';
                      }),
                  TextFormBox(
                      controller: _resultController,
                      header: "Result: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Result';
                      }),
                  TextFormBox(
                      controller: _reasonController,
                      header:
                          "Reason for which the student left the institute: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Reason';
                      }),
                  TextFormBox(
                      controller: _conductController,
                      header: "Conduct: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Conduct';
                      }),
                  TextFormBox(
                      controller: _dateLeaveController,
                      header:
                          "Date on which the student Actually left the institute: ",
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.solid),
                        shape: BoxShape.rectangle,
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Please Enter Date to left the institude';
                      }),
                ],
              ),
              Positioned(
                top: 570,
                right: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      child: Text("Save and Generate"),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return ContentDialog(
                                constraints: BoxConstraints(
                                    maxHeight: 400, maxWidth: 500),
                                title: Text("Are you sure to generate file ?"),
                                actions: [
                                  Button(
                                      child: Text("Engineering"),
                                      onPressed: getEngineerTC),
                                  Button(
                                      child: Text("Pharmacy"),
                                      onPressed: getPharmacyTC),
                                  Button(
                                      child: Text("Science & Commerce"),
                                      onPressed: getCommerceTC),
                                  Button(
                                      child: Text("Cancel"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ],
                              );
                            }),
                          );
                          print('form is validated');
                        } else {
                          print('form is not validated');
                        }
                      },
                      style: ButtonStyle(
                        elevation: ButtonState.all(7.0),
                        padding: ButtonState.all(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        shape: ButtonState.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getPharmacyTC() async {
    Navigator.of(context).pop();
    Directory tempDir = await getApplicationDocumentsDirectory();
    String path = tempDir.path;
    String fileName = _nameController.text;
    var pdf = await TemplatePharmacy(
      _tcNoController.text,
      _nameController.text,
      _fNameController.text,
      _mNameController.text,
      _genderController.text,
      _dobController.text,
      _courseAndBranchController.text,
      _semStudentAdmittedController.text,
      _semStudentLeaveController.text,
      _rollNoController.text,
      _resultController.text,
      _reasonController.text,
      _conductController.text,
      _dateLeaveController.text,
    ).createPdf(path, fileName);

    _dataController.adddData(Student(
      tcNo: _tcNoController.text,
      category: "Pharmacy",
      name: _nameController.text,
      fName: _fNameController.text,
      mName: _mNameController.text,
      gender: _genderController.text,
      DOB: _dobController.text,
      courseAndBranch: _courseAndBranchController.text,
      semStudentAdmitted: _semStudentAdmittedController.text,
      semStudentLeave: _semStudentLeaveController.text,
      rollNo: _rollNoController.text,
      result: _resultController.text,
      reason: _reasonController.text,
      conduct: _conductController.text,
      dateLeave: _dateLeaveController.text,
      date: "",
    ));

    _clearText();
    showSnackbar(context, Snackbar(content: Text("Generation Completed")));
  }

  getEngineerTC() async {
    Navigator.of(context).pop();
    Directory tempDir = await getApplicationDocumentsDirectory();
    String path = tempDir.path;
    String fileName = _nameController.text;
    var pdf = await TemplateEngineering(
      _tcNoController.text,
      _nameController.text,
      _fNameController.text,
      _mNameController.text,
      _genderController.text,
      _dobController.text,
      _courseAndBranchController.text,
      _semStudentAdmittedController.text,
      _semStudentLeaveController.text,
      _rollNoController.text,
      _resultController.text,
      _reasonController.text,
      _conductController.text,
      _dateLeaveController.text,
    ).createPdf(path, fileName);

    _dataController.adddData(Student(
      category: "Engineer",
      tcNo: _tcNoController.text,
      name: _nameController.text,
      fName: _fNameController.text,
      mName: _mNameController.text,
      gender: _genderController.text,
      DOB: _dobController.text,
      courseAndBranch: _courseAndBranchController.text,
      semStudentAdmitted: _semStudentAdmittedController.text,
      semStudentLeave: _semStudentLeaveController.text,
      rollNo: _rollNoController.text,
      result: _resultController.text,
      reason: _reasonController.text,
      conduct: _conductController.text,
      dateLeave: _dateLeaveController.text,
      date: "",
    ));

    _clearText();
    showSnackbar(context, Snackbar(content: Text("Generation Completed")));
  }

  getCommerceTC() async {
    Navigator.of(context).pop();
    Directory tempDir = await getApplicationDocumentsDirectory();
    String path = tempDir.path;
    String fileName = _nameController.text;
    var pdf = await TemplateCommerce(
      _tcNoController.text,
      _nameController.text,
      _fNameController.text,
      _mNameController.text,
      _genderController.text,
      _dobController.text,
      _courseAndBranchController.text,
      _semStudentAdmittedController.text,
      _semStudentLeaveController.text,
      _rollNoController.text,
      _resultController.text,
      _reasonController.text,
      _conductController.text,
      _dateLeaveController.text,
    ).createPdf(path, fileName);

    _dataController.adddData(Student(
      category: "Commerce",
      tcNo: _tcNoController.text,
      name: _nameController.text,
      fName: _fNameController.text,
      mName: _mNameController.text,
      gender: _genderController.text,
      DOB: _dobController.text,
      courseAndBranch: _courseAndBranchController.text,
      semStudentAdmitted: _semStudentAdmittedController.text,
      semStudentLeave: _semStudentLeaveController.text,
      rollNo: _rollNoController.text,
      result: _resultController.text,
      reason: _reasonController.text,
      conduct: _conductController.text,
      dateLeave: _dateLeaveController.text,
      date: "",
    ));

    _clearText();
    showSnackbar(context, Snackbar(content: Text("Generation Completed")));
  }

  void _clearText() {
    _tcNoController.clear();
    _nameController.clear();
    _fNameController.clear();
    _mNameController.clear();
    _genderController.clear();
    _dobController.clear();
    _courseAndBranchController.clear();
    _semStudentAdmittedController.clear();
    _semStudentLeaveController.clear();
    _rollNoController.clear();
    _resultController.clear();
    _reasonController.clear();
    _conductController.clear();
    _dateLeaveController.clear();
  }
}
