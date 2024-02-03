import 'package:bato_agent/besh.dart';
import 'package:bato_agent/ikki.dart';
import 'package:bato_agent/uch.dart';
import 'package:flutter/material.dart';
import 'ikki.dart';
import 'uch.dart';
import 'turt.dart';
import 'besh.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: f(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  void nomvoid(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static List<Widget> images = <Widget>[s(), d(), t(), f()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: images.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        backgroundColor:
            Colors.blue, // Change background color of the navigation bar
        selectedItemColor: Colors.purple[400], // Change selected item color
        unselectedItemColor: Colors.grey, // Change unselected item color
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Bosh sahifa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.autorenew),
            label: 'Yangilash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sozlamalar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
