import 'package:fluent_ui/fluent_ui.dart';

class AppBasePage extends StatefulWidget {
  const AppBasePage({Key? key}) : super(key: key);

  @override
  State<AppBasePage> createState() => _AppBasePageState();
}

class _AppBasePageState extends State<AppBasePage> {
  @override
  Widget build(BuildContext context) {
    return NavigationView();
  }
}
