import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:transfer_certificate_generator/service/data_controller.dart';
import 'package:transfer_certificate_generator/service/data_store.dart';

class CommerceScreen extends StatefulWidget {
  const CommerceScreen({Key? key}) : super(key: key);

  @override
  State<CommerceScreen> createState() => _CommerceScreenState();
}

class _CommerceScreenState extends State<CommerceScreen> {
  final DataController _dataController = DataController(DataStoreService());

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: Container(
        color: Colors.white,
        height: double.infinity,
        child: FutureBuilder(
          future: _dataController.fetchCommerceData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData && snapshot.data.length != 0) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        print("It works");
                      },
                      child: Card(
                        elevation: 6.0,
                        padding: EdgeInsets.all(28.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].name),
                            Text(snapshot.data![index].DOB),
                            IconButton(
                              icon: Icon(FluentIcons.delete),
                              onPressed: () {
                                _dataController.delete(
                                    snapshot.data![index].name,
                                    snapshot.data![index].DOB);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(child: Text("No Data Found"));
            }
          },
        ),
      ),
    );
  }
}
