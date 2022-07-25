import 'package:fluent_ui/fluent_ui.dart';
import 'package:transfer_certificate_generator/screens/appbase.dart';
import 'package:transfer_certificate_generator/templates/template_1.dart';
import 'package:transfer_certificate_generator/templates/template_2.dart';
import 'package:transfer_certificate_generator/templates/template_3.dart';

void main() {
  TemplateCommerce(
          'Prakhar Jaiswal',
          'Bharat Lal ',
          'Vimala Baghel',
          'Male',
          '18-03-2001',
          'B.Tech(Computer Science and Engineering)',
          '1st Semester',
          '6th Semester',
          'BH3404 / 300202219043',
          'Passed',
          'Asshish ki biwi ka case ko dekh laga ab placement to milne se raha',
          'conduct',
          '25-06-2001')
      .createPdf();
  // runApp(TransferCertificateGenerator());
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
