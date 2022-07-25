import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EngineeringFormScreen extends StatefulWidget {
  const EngineeringFormScreen({Key? key}) : super(key: key);

  @override
  State<EngineeringFormScreen> createState() => _EngineeringFormScreenState();
}

class _EngineeringFormScreenState extends State<EngineeringFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Engineering Screen"),
    );
  }
}
