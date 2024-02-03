import 'package:flutter/material.dart';

class t extends StatefulWidget {
  const t({super.key});

  @override
  State<t> createState() => _tState();
}

class _tState extends State<t> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        toolbarHeight: 100,
        title: Row(children: [
          Text("Sozlamalar"),
        ]),
      ),
    );
  }
}
