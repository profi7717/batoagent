import 'package:bato_agent/agent.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:agent_ilova/list.dart';
// import 'package:agent_ilova/xaridor.dart';
// import 'package:agent_ilova/zakaz.dart';

import 'package:http/http.dart' as http;
import 'package:bcrypt/bcrypt.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey _scaffoldKey = GlobalKey();

  List<Map<String, dynamic>> data = [];
  dynamic parol = '';
  dynamic staffid = "";
  String rasm = "";
  String lavozim = "";
  var user = "";
  var name = "";
  var fullname = "";
  void login(user) async {
    final response = await http
        .get(Uri.parse('https://dash.vips.uz/api/11/46/1919?username=$user'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      final List<dynamic> jsonData = jsonDecode(response.body);

      // Assuming the API response is a list of Maps
      // Add the data to the 'data' list
      for (var item in jsonData) {
        data.add(Map<String, dynamic>.from(item));

        parol = (item["password"]);
        name = (item["username"]);
        // await SessionManager().set("staffid", (item["agent_id"]));
        // await SessionManager().set("fullname", (item["f_I_O"]));
        // await SessionManager().set("rasm", (item["rasmi"]));
        // // await SessionManager().set("lavozim", (item["position"]));
        // staffid = await SessionManager().get("staffid");
        // fullname = await SessionManager().get("fullname");
        // rasm = await SessionManager().get("rasm");
        // lavozim = await SessionManager().get("lavozim");
        //
        final bool checkPassword = BCrypt.checkpw('password', parol);
      }
      user = usernameController.text;
      correctPassword = BCrypt.checkpw(passwordController.text, parol);
      setState(() {
        if (correctPassword == true) {
          // print(fullname);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        } else {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Login yoki parol hato"),
              backgroundColor: Colors.purple,
            ));
          });
        }
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Login yoki parol hato")));
      });
    }
  }

  bool correctPassword = false;
  final stil = TextStyle(color: Colors.black);
  bool isChecked = false;
  bool see = true;
  Color eye = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[400],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
              ),
              TextFormField(
                style: stil,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: stil,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                style: stil,
                controller: passwordController,
                obscureText: see,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          see == !see;
                          if (see == true) {
                            eye = Colors.black;
                          } else {
                            eye = Colors.red;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: eye,
                      )),
                  labelText: 'Password',
                  labelStyle: stil,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      Checkbox(
                          // tristate: true,
                          activeColor: Colors.purple[400],
                          value: isChecked,
                          onChanged: (newbool) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          }),
                      Flexible(
                          child: Text(
                        "Parolni eslab qolish",
                        style: stil,
                        selectionColor: Colors.grey,
                      ))
                    ],
                  )),
              InkWell(
                onTap: () {
                  login(usernameController.text);
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
                height: 30,
              ),
              Text(
                "Powered by BATO",
                style: stil,
                selectionColor: Colors.purple[400],
              )
            ],
          ),
        ),
      ),
    );
  }
}
