import 'package:fluent_ui/fluent_ui.dart';
import 'package:transfer_certificate_generator/models/student.dart';
import 'package:transfer_certificate_generator/service/data_store.dart';

class AppBasePage extends StatefulWidget {
  const AppBasePage({Key? key}) : super(key: key);

  @override
  State<AppBasePage> createState() => _AppBasePageState();
}

class _AppBasePageState extends State<AppBasePage> {
  final data = DataStoreService();

  @override
  Widget build(BuildContext context) {
    List<Student> l = [Student(name: 'Prakhar')];
    return NavigationView(
      content: TextButton(
        child: Text("Press me"),
        onPressed: () async {
          data.addData(Student(name: "prakhar", fName: "bharat"));
          print(data.dataList.length);
          data.savaData();
        },
      ),
    );
  }
}
