import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

class EngineeringScreen extends StatefulWidget {
  const EngineeringScreen({Key? key}) : super(key: key);

  @override
  State<EngineeringScreen> createState() => _EngineeringScreenState();
}

class _EngineeringScreenState extends State<EngineeringScreen> {
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 6.0,
                  padding: EdgeInsets.all(28.0),
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Engineering Pdf"),
                      Text("Issue Date"),
                      Icon(FluentIcons.delete),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
