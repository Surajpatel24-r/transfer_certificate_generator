import 'package:transfer_certificate_generator/models/student.dart';
import 'package:transfer_certificate_generator/service/data_store.dart';

class DataController {
  final DataStoreService _dataStore;

  DataController(this._dataStore);

  Future<List<Student>> fetchPharmacyData() async {
    return _dataStore.getPharmacyDataList();
  }

  Future<List<Student>> fetchEngineerData() async {
    return _dataStore.getEngineerDataList();
  }

  Future<List<Student>> fetchCommerceData() async {
    return _dataStore.getCommerceDataList();
  }

  delete(String name, String DOB) async {
    await _dataStore.deletaData(name, DOB);
  }

  adddData(Student student) {
    print("called");
    _dataStore.addData(student);
    print(student);
  }
}
