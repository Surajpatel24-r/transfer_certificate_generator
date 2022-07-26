import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
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
                      Text("Pharmacy pdf"),
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
