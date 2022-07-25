import 'package:flutter/cupertino.dart';

class CommerceScreen extends StatefulWidget {
  const CommerceScreen({Key? key}) : super(key: key);

  @override
  State<CommerceScreen> createState() => _CommerceScreenState();
}

class _CommerceScreenState extends State<CommerceScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Commerece Screen"),
    );
  }
}
