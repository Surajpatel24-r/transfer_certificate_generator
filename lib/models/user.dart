class UserFields {
  static final String tc = 'TC No.';
  static final String name = 'Student Name';
  static final String fName = "Father's Name";
  static final String mName = "Mother's Name";
  static final String gender = 'Gender';
  static final String DOB = 'D-O-B';
  static final String courseAndBranch = 'Course And Branch';
  static final String semStudentAdmitted = 'Sem Student Admitted';
  static final String semStudentLeave = 'Sem Student Leave';
  static final String rollNo = 'Roll No.';
  static final String result = 'Result';
  static final String reason = 'Reason';
  static final String conduct = 'Conduct';
  static final String dateLeave = 'Date Student Left';

  static List<String> getFields() => [
        tc,
        name,
        fName,
        mName,
        gender,
        DOB,
        courseAndBranch,
        semStudentAdmitted,
        semStudentLeave,
        rollNo,
        result,
        reason,
        conduct,
        dateLeave,
      ];
}

class User {
  final String tc;
  final String name;
  final String fName;
  final String mName;
  final String gender;
  final String DOB;
  final String courseAndBranch;
  final String semStudentAdmitted;
  final String semStudentLeave;
  final String rollNo;
  final String result;
  final String reason;
  final String conduct;
  final String dateleave;

  const User({
    required this.tc,
    required this.name,
    required this.fName,
    required this.mName,
    required this.gender,
    required this.DOB,
    required this.courseAndBranch,
    required this.semStudentAdmitted,
    required this.semStudentLeave,
    required this.rollNo,
    required this.result,
    required this.reason,
    required this.conduct,
    required this.dateleave,
  });

  Map<String, dynamic> toJson() => {
        UserFields.tc: tc,
        UserFields.name: name,
        UserFields.fName: fName,
        UserFields.mName: mName,
        UserFields.gender: gender,
        UserFields.DOB: DOB,
        UserFields.courseAndBranch: courseAndBranch,
        UserFields.semStudentAdmitted: semStudentAdmitted,
        UserFields.semStudentLeave: semStudentLeave,
        UserFields.rollNo: rollNo,
        UserFields.result: result,
        UserFields.reason: reason,
        UserFields.conduct: conduct,
        UserFields.dateLeave: dateleave,
      };
}
