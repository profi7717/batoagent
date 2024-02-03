import 'package:flutter/material.dart';

class d extends StatefulWidget {
  const d({super.key});

  @override
  State<d> createState() => _dState();
}

class _dState extends State<d> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        toolbarHeight: 100,
        title: Row(children: [
          Text("Yangilash"),
        ]),
      ),
    );
  }
}
