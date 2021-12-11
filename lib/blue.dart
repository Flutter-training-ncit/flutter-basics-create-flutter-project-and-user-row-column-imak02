import 'package:flutter/material.dart';

class Blue extends StatefulWidget {
  const Blue({Key? key}) : super(key: key);

  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
