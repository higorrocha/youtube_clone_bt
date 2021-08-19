import 'package:flutter/material.dart';

class Whatshot extends StatefulWidget {
  const Whatshot({Key? key}) : super(key: key);

  @override
  _WhatshotState createState() => _WhatshotState();
}

class _WhatshotState extends State<Whatshot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Whatshot",
        style: TextStyle(
            fontSize: 25
        ),
      ),
    );
  }
}
