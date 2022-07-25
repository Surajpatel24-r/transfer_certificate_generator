import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommerceFormScreen extends StatefulWidget {
  const CommerceFormScreen({Key? key}) : super(key: key);

  @override
  State<CommerceFormScreen> createState() => _CommerceFormScreenState();
}

class _CommerceFormScreenState extends State<CommerceFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Commerece Screen"),
    );
  }
}
