class Student {
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

  String? date, category;

  Student(
      {this.category = '',
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
      this.date,
      this.dateLeave});

  Student.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
