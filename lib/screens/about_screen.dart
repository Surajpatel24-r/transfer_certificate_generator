import 'package:fluent_ui/fluent_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  final Uri _github = Uri.parse(
      'https://github.com/Surajpatel24-r/transfer_certificate_generator');
  final Uri _prajaiUrl = Uri.parse('https://github.com/prajai1803');
  final Uri _surajUrl = Uri.parse('https://github.com/Surajpatel24-r');

  Future _githublaunchUrl() async {
    if (!await launchUrl(_github)) {
      throw 'Could not launch $_github';
    }
  }

  Future _prajailaunchUrl() async {
    if (!await launchUrl(_prajaiUrl)) {
      throw 'Could not launch $_prajaiUrl';
    }
  }

  Future _surajlaunchUrl() async {
    if (!await launchUrl(_surajUrl)) {
      throw 'Could not launch $_surajUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/tc_logo.png',
            height: 200,
            width: 200,
          ),
          Text(
            "Transfer Certificate Generator",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Transfer Certificate Generator is designed for generator transfer certificate for Chouksey Engineering College, Bilaspur.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Website",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextButton(
              child: Text("Project Github"),
              onPressed: _githublaunchUrl,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card(
                elevation: 10,
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Project Manager",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: TextButton(
                          child: Text(
                            "Prakhar Jaiswal",
                            style: TextStyle(
                                fontSize: 12, fontStyle: FontStyle.italic),
                          ),
                          onPressed: _prajailaunchUrl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Developer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Prakhar Jaiswal",
                          style: TextStyle(
                              fontSize: 12, fontStyle: FontStyle.italic),
                        ),
                        onPressed: _prajailaunchUrl,
                      ),
                      TextButton(
                        child: Text(
                          "Suraj Patel",
                          style: TextStyle(
                              fontSize: 12, fontStyle: FontStyle.italic),
                        ),
                        onPressed: _surajlaunchUrl,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  height: 200,
                  width: 300,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Contributor",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Prakhar Jaiswal, Suraj Patel",
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
