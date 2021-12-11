import 'package:flutter/material.dart';

class Yellow extends StatefulWidget {
  const Yellow({Key? key}) : super(key: key);

  @override
  _YellowState createState() => _YellowState();
}

class _YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
