import 'package:flutter/material.dart';

class Green extends StatefulWidget {
  const Green({Key? key}) : super(key: key);

  @override
  _GreenState createState() => _GreenState();
}

class _GreenState extends State<Green> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}
