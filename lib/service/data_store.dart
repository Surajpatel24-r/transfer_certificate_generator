import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfer_certificate_generator/models/student.dart';

class DataStoreService {
  List<Student> dataList = [];

  DataStoreService() {
    getDataList();
  }

  addData(Student value) {
    dataList.add(value);
  }

  isNotEmpty() {
    if (dataList.isNotEmpty) {
      return;
    } else {
      return;
    }
  }

  Future savaData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userdata", jsonEncode(dataList));
    print("Data Saved");
  }

  getDataList() async {
    if (dataList.isEmpty) {
      final prefs = await SharedPreferences.getInstance();
      var decode = await jsonDecode(prefs.getString("userdata")!);
      for (var i in decode!) {
        dataList.add(Student.fromJson(i));
      }
    }
  }
}
