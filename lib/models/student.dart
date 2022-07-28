import 'dart:convert';

class Student {
  String? tcNo;
  String? name;
  String? fName;
  String? mName;
  String? gender;
  String? DOB;
  String? courseAndBranch;
  String? semStudentAdmitted;
  String? semStudentLeave;
  String? rollNo;
  String? result;
  String? reason;
  String? conduct;
  String? dateLeave;

  String? date;
  String category = '';

  Student({
    this.tcNo,
    this.category = '',
    this.name,
    this.fName,
    this.mName,
    this.gender,
    this.DOB,
    this.courseAndBranch,
    this.semStudentAdmitted,
    this.semStudentLeave,
    this.rollNo,
    this.result,
    this.reason,
    this.conduct,
    this.dateLeave,
    this.date,
  });

  Student.fromJson(Map<String, dynamic> json)
      : category = json['category'],
        tcNo = json['tcNo'],
        name = json['name'],
        fName = json['fName'],
        mName = json['mName'],
        gender = json['gender'],
        DOB = json['DOB'],
        courseAndBranch = json['courseAndBranch'],
        semStudentAdmitted = json['semStudentAdmitted'],
        semStudentLeave = json['semStudentLeave'],
        rollNo = json['rollNo'],
        result = json['result'],
        reason = json['reason'],
        conduct = json['conduct'],
        dateLeave = json['dataLeave'],
        date = json['data'];

  Map<String, dynamic> toJson() => {
        'category': category,
        'tcNo': tcNo,
        'name': name,
        'fName': fName,
        'mName': mName,
        'gender': gender,
        'DOB': DOB,
        'courseAndBranch': courseAndBranch,
        'semStudentAdmitted': semStudentAdmitted,
        'semStudentLeave': semStudentLeave,
        'rollNo': rollNo,
        'result': result,
        'conduct': conduct,
        'dateLeave': dateLeave,
        'data': date,
      };
}
