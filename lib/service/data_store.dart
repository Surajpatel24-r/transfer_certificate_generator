import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfer_certificate_generator/models/student.dart';

class DataStoreService {
  List<Student> dataList = [];

  DataStoreService() {
    loadData();
  }

  Future addData(Student value) async {
    final prefs = await SharedPreferences.getInstance();
    dataList.add(value);
    await prefs.setString("userdata", jsonEncode(dataList));
    print(dataList);
  }

  reloadData() async {
    List<Student> temList = [];
    final prefs = await SharedPreferences.getInstance();
    var decode = await jsonDecode(prefs.getString("userdata")!);
    for (var i in decode!) {
      temList.add(Student.fromJson(i));
      dataList = temList;
    }
  }

  loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var decode = jsonDecode(prefs.getString("userdata") ?? '');
      for (var i in decode!) {
        this.dataList.add(Student.fromJson(i));
      }
    } catch (e) {
      print("Failed to Load");
    }
  }

  Future<List<Student>> getCommerceDataList() async {
    List<Student> commerceDataList = [];
    final prefs = await SharedPreferences.getInstance();
    var decode = await jsonDecode(prefs.getString("userdata")!);
    for (var i in decode) {
      if (Student.fromJson(i).category == "Commerce")
        commerceDataList.add(Student.fromJson(i));
    }
    return commerceDataList;
  }

  Future<List<Student>> getPharmacyDataList() async {
    List<Student> pharmacyDataList = [];
    final prefs = await SharedPreferences.getInstance();
    var decode = await jsonDecode(prefs.getString("userdata")!);
    for (var i in decode) {
      if (Student.fromJson(i).category == "Pharmacy")
        pharmacyDataList.add(Student.fromJson(i));
    }
    return pharmacyDataList;
  }

  Future<List<Student>> getEngineerDataList() async {
    List<Student> engineerDataList = [];
    final prefs = await SharedPreferences.getInstance();
    var decode = await jsonDecode(prefs.getString("userdata")!);
    for (var i in decode) {
      if (Student.fromJson(i).category == "Engineer")
        engineerDataList.add(Student.fromJson(i));
    }
    return engineerDataList;
  }

  Future<List<Student>> getAllDataList() async {
    List<Student> l = [];
    final prefs = await SharedPreferences.getInstance();
    var decode = await jsonDecode(prefs.getString("userdata")!);
    for (var i in decode!) {
      l.add(Student.fromJson(i));
    }
    return l;
  }

  Future deletaData(String deleteName, String DOB) async {
    final prefs = await SharedPreferences.getInstance();
    var decode = await jsonDecode(prefs.getString("userdata")!);
    dataList.removeWhere(
        (element) => element.name == deleteName && element.DOB == DOB);
    await prefs.setString("userdata", jsonEncode(dataList));
    print("delete");
  }
}
