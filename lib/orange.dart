import 'package:flutter/material.dart';

class Orange extends StatefulWidget {
  const Orange({Key? key}) : super(key: key);

  @override
  _OrangeState createState() => _OrangeState();
}

class _OrangeState extends State<Orange> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
    );
  }
}
