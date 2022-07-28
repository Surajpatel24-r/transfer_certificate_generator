import 'package:fluent_ui/fluent_ui.dart';
import 'package:transfer_certificate_generator/models/student.dart';
import 'package:transfer_certificate_generator/screens/commercescreen.dart';
import 'package:transfer_certificate_generator/screens/engineeringscreen.dart';
import 'package:transfer_certificate_generator/screens/homescreen.dart';
import 'package:transfer_certificate_generator/screens/pharmacyscreen.dart';
import 'package:transfer_certificate_generator/service/data_store.dart';

void main() async {
  var a = await DataStoreService();
  var n = a.dataList;
  print("hey $n");

  runApp(
    const FluentApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: Text(
          'Transfer Certificate',
          style: TextStyle(fontSize: 20),
        ),
        automaticallyImplyLeading: true,
      ),
      pane: NavigationPane(
        selected: _currentPage,
        onChanged: (i) => setState(() {
          _currentPage = i;
        }),
        displayMode: PaneDisplayMode.auto,
        items: <NavigationPaneItem>[
          PaneItem(
            icon: Icon(FluentIcons.home),
            title: Text("Home"),
          ),
          PaneItem(
            icon: Icon(FluentIcons.engineering_group),
            title: Text("Engineering"),
          ),
          PaneItem(
            icon: Icon(FluentIcons.engineering_group),
            title: Text("Pharmacy"),
          ),
          PaneItem(
            icon: Icon(FluentIcons.engineering_group),
            title: Text("Science & Commerce"),
          ),
        ],
      ),
      content: NavigationBody(index: _currentPage, children: <Widget>[
        HomePageScreen(),
        EngineeringScreen(),
        PharmacyScreen(),
        CommerceScreen(),
      ]),
    );
  }
}
