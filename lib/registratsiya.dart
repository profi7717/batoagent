import 'package:flutter/material.dart';

class raqam extends StatefulWidget {
  const raqam({super.key});

  @override
  State<raqam> createState() => _raqamState();
}

class _raqamState extends State<raqam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: Center(child: Text("Ro'yxatdan o'tish")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      labelText: "Telefon raqami"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "User name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: "Passwod"),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Ro'yxatdan o'tish orqali "),
              Text("ommaviy oferta shartlariga rozilik bildirasiz"),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 40,
                child: Center(
                  child: Text(
                    "Ro'yxatdan o'tish",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.purple[400]),
              ),
            ],
          ),
        ));
  }
}
