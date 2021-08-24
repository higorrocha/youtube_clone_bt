import 'package:flutter/material.dart';
import 'package:youtube_clone_bt/Api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.searchs("");

    return Container(
      child: Text(
        "Home",
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}
