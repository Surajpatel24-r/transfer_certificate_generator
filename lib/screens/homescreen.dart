import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:transfer_certificate_generator/screens/form/allform.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // GestureDetector(
          //   onTap: () {},
          //   child: Card(
          //     backgroundColor: Colors.white,
          //     child: Text("Add"),
          //     padding: EdgeInsets.symmetric(horizontal: 100, vertical: 200),
          //     elevation: 10.0,
          //   ),
          // ),
          Button(
            child: Icon(FluentIcons.add),
            onPressed: () {
              Navigator.of(context).push(FluentPageRoute(
                builder: (context) => AllFormScreen(),
              ));
            },
            style: ButtonStyle(
              elevation: ButtonState.all(10.0),
              padding: ButtonState.all(
                EdgeInsets.symmetric(horizontal: 100, vertical: 200),
              ),
              shape: ButtonState.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Button(
            child: Text("Import"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ContentDialog(
                    title: Text('Are you sure to Import a pdf file'),
                    content: Text('Check kar le ek baar Bosdike'),
                    actions: [
                      Button(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  );
                },
              );
            },
            style: ButtonStyle(
              elevation: ButtonState.all(10.0),
              padding: ButtonState.all(
                EdgeInsets.symmetric(horizontal: 100, vertical: 200),
              ),
              shape: ButtonState.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Button(
            child: Text("Export"),
            onPressed: () {},
            style: ButtonStyle(
              elevation: ButtonState.all(10.0),
              padding: ButtonState.all(
                EdgeInsets.symmetric(horizontal: 100, vertical: 200),
              ),
              shape: ButtonState.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
