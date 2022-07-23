import 'package:fluent_ui/fluent_ui.dart';
import 'package:transfer_certificate_generator/screens/appbase.dart';

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
        home: AppBasePage());
  }
}
