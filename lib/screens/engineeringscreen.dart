import 'package:flutter/cupertino.dart';

class EngineeringScreen extends StatefulWidget {
  const EngineeringScreen({Key? key}) : super(key: key);

  @override
  State<EngineeringScreen> createState() => _EngineeringScreenState();
}

class _EngineeringScreenState extends State<EngineeringScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Engineering Screen"),
    );
  }
}
