import 'package:flutter/material.dart';

class Red extends StatefulWidget {
  const Red({Key? key}) : super(key: key);

  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
