import 'package:fluent_ui/fluent_ui.dart';
import 'package:transfer_certificate_generator/api/sheets/tc_sheets_api.dart';
import 'package:transfer_certificate_generator/models/user.dart';

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
          Button(
            child: Icon(FluentIcons.add),
            onPressed: () {
              Navigator.of(context).push(FluentPageRoute(
                builder: (context) => AllFormScreen(
                  onSavedUser: (user) async {
                    await TcSheetApi.insert(
                      [user.toJson()],
                    );
                  },
                  onSavedUser2: (user) async {
                    await TcSheetApi.insert2(
                      [user.toJson()],
                    );
                  },
                  onSavedUser3: (user) async {
                    await TcSheetApi.insert3(
                      [user.toJson()],
                    );
                  },
                ),
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
                    title: Text('Are you sure to Import file'),
                    content: Text('file must be .json'),
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ContentDialog(
                    title: Text('Are you sure to Export file'),
                    content: Text('file must be .json'),
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
        ],
      ),
    );
  }

  Future insertUsers() async {
    final users = [
      User(
          tc: 'tc',
          name: 'name',
          fName: 'fName',
          mName: 'mNAme',
          gender: 'gender',
          DOB: 'DOB',
          courseAndBranch: 'courseAndBranch',
          semStudentAdmitted: 'semStudentAdmitted',
          semStudentLeave: 'semStudentLeave',
          rollNo: 'rollNo',
          result: 'result',
          reason: 'reason',
          conduct: 'conduct',
          dateleave: 'dateleave')
    ];

    final jsonUsers = users.map((user) => user.toJson()).toList();

    await TcSheetApi.insert(jsonUsers);
    await TcSheetApi.insert2(jsonUsers);
    await TcSheetApi.insert3(jsonUsers);
  }
}
