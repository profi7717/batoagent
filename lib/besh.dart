import 'package:bato_agent/login.dart';
import 'package:bato_agent/registratsiya.dart';
import 'package:flutter/material.dart';

class f extends StatefulWidget {
  const f({super.key});

  @override
  State<f> createState() => _fState();
}

class _fState extends State<f> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        toolbarHeight: 100,
        title: Row(children: [
          Text("Profil"),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                width: 500,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.purple[400]),
                child: Center(
                    child: Text(
                  'Kirish',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => raqam()));
              },
              child: Container(
                width: 500,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.purple)),
                child: Center(
                    child: Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(fontSize: 15, color: Colors.purple),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
