import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transfer_certificate_generator/screens/engineeringscreen.dart';

class AllFormScreen extends StatefulWidget {
  const AllFormScreen({Key? key}) : super(key: key);

  @override
  State<AllFormScreen> createState() => _AllFormScreenState();
}

class _AllFormScreenState extends State<AllFormScreen> {
  final _formkey = GlobalKey<FormState>();

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
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 5, crossAxisSpacing: 20.0),
            children: [
              TextFormBox(
                controller: _nameController,
                validator: (text) {
                  if (text == null || text.isEmpty)
                    return 'Please Enter a Name';
                },
                header: "Name of the Students: ",
                // placeholder: 'Enter Name of the Students',
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  shape: BoxShape.rectangle,
                ),
              ),
              TextFormBox(
                  controller: _fNameController,
                  header: "Father's Name: ",
                  // placeholder: "Enter Father's Name",
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
                  // placeholder: "Enter Mother's Name",
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
                  // placeholder: 'Enter Gender',
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
                  header: "Date of birth as per record: ",
                  // placeholder: 'Enter Date of birth as per record',
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) return 'Please Enter DOB';
                  }),
              TextFormBox(
                  controller: _courseAndBranchController,
                  header:
                      "Course and Branch to which the student was admitted: ",
                  // placeholder:
                  //     'Enter Course and Branch to which the student was admitted',
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
                  // placeholder: 'Enter Semester to which the student was admitted',
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
                  // placeholder:
                  //     'Enter Semester in which the student was studying at the time of leaving',
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
                  // placeholder: 'Enter University Roll No/ Enrollment No',
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
                  // placeholder: 'Enter Result',
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
                  header: "Reason for which the student left the institute: ",
                  // placeholder:
                  //     'Enter Reason for which the student left the institute',
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
                  // placeholder: 'Enter Conducs',
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
                  // placeholder:
                  //     'Enter Date on which the student Actually left the institute',
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.solid),
                    shape: BoxShape.rectangle,
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty)
                      return 'Please Enter Date to left the institude';
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    child: Text("Save and Print"),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          FluentPageRoute(
                            builder: (context) => EngineeringFormScreen(),
                          ),
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
                  Button(
                    child: Text("Cancle"),
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: ButtonState.all(7.0),
                      padding: ButtonState.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      shape: ButtonState.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
