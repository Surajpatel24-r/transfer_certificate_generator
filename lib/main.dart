import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfer_certificate_generator/screens/appbase.dart';
import 'package:transfer_certificate_generator/templates/template_1.dart';
import 'package:transfer_certificate_generator/templates/template_2.dart';
import 'package:transfer_certificate_generator/templates/template_3.dart';

void main() {
  runApp(TransferCertificateGenerator());
}

class TransferCertificateGenerator extends StatelessWidget {
  const TransferCertificateGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
        checkerboardOffscreenLayers: false,
        theme: ThemeData(),
        title: "Transfer Certificate Generator",
        debugShowCheckedModeBanner: false,
        home: );
  }
}
