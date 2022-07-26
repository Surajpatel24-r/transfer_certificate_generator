import 'package:fluent_ui/fluent_ui.dart';
import 'package:transfer_certificate_generator/models/student.dart';
import 'package:transfer_certificate_generator/api/sheets/tc_sheets_api.dart';
import 'package:transfer_certificate_generator/screens/commercescreen.dart';
import 'package:transfer_certificate_generator/screens/about_screen.dart';
import 'package:transfer_certificate_generator/screens/engineeringscreen.dart';
import 'package:transfer_certificate_generator/screens/homescreen.dart';
import 'package:transfer_certificate_generator/screens/pharmacyscreen.dart';
import 'package:transfer_certificate_generator/service/data_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TcSheetApi.init();
  await TcSheetApi.init2();
  await TcSheetApi.init3();
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
            icon: Icon(FluentIcons.page_list),
            title: Text("Engineering"),
          ),
          PaneItem(
            icon: Icon(FluentIcons.page_list),
            title: Text("Pharmacy"),
          ),
          PaneItem(
            icon: Icon(FluentIcons.page_list),
            title: Text("Science & Commerce"),
          ),
          PaneItem(
            icon: Icon(FluentIcons.info12),
            title: Text("About"),
          ),
        ],
      ),
      content: NavigationBody(index: _currentPage, children: <Widget>[
        HomePageScreen(),
        EngineeringScreen(),
        PharmacyScreen(),
        CommerceScreen(),
        AboutScreen(),
      ]),
    );
  }
}
