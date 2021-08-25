import 'package:flutter/material.dart';
import 'package:youtube_clone_bt/CustomSearchDelegate.dart';
import 'package:youtube_clone_bt/screens/HomeScreen.dart';
import 'package:youtube_clone_bt/screens/Library.dart';
import 'package:youtube_clone_bt/screens/Subscriptions.dart';
import 'package:youtube_clone_bt/screens/Whatshot.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndice = 0;
  String _result = "";

  @override
  Widget build(BuildContext context) {

    List screens = [
      HomeScreen(_result),
      Whatshot(),
      Subscriptions(),
      Library()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black45,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
            width: 98,
            height: 22,
        ),
        actions: [

          IconButton(
              onPressed: () async {
                String? res = await showSearch(context: context, delegate: CustomSearchDelegate());
                setState(() {
                  _result = res!;
                });
              },
              icon: Icon(Icons.search)
          )

        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_currentIndice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndice,
        onTap: (indice){
          setState(() {
            _currentIndice = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xfffe0000),
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: "Whatshot",
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              label: "Subscriptions",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              label: "Libary",
              icon: Icon(Icons.folder)
          )
        ],
      ),
    );
  }
}
