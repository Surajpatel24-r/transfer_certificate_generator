import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PharmacyFormScreen extends StatefulWidget {
  const PharmacyFormScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyFormScreen> createState() => _PharmacyFormScreenState();
}

class _PharmacyFormScreenState extends State<PharmacyFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Pharmacy Screen"),
    );
  }
}
