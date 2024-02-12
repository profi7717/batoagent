import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bcrypt/bcrypt.dart';

class raqam extends StatefulWidget {
  const raqam({super.key});

  @override
  State<raqam> createState() => _raqamState();
}

class _raqamState extends State<raqam> {
  TextEditingController telefonController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String hashedPassword = "";
  bool correct = false;

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
                controller: telefonController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  labelText: "Telefon raqami",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "User name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(height: 50),
            Text("Ro'yxatdan o'tish orqali"),
            Text("ommaviy oferta shartlariga rozilik bildirasiz"),
            SizedBox(height: 50),
            InkWell(
              onTap: () async {
                hashedPassword = await BCrypt.hashpw(
                    passwordController.text, BCrypt.gensalt());
                setState(() {
                  postData();
                });
              },
              child: Container(
                width: 200,
                height: 40,
                child: Center(
                  child: Text(
                    "Ro'yxatdan o'tish ",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.purple[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postData() async {
    final String apiUrl = "https://dash.vips.uz/api-in/11/46/1919";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'apipassword': '1111',
          'passwordd': hashedPassword,
          'telraqami': telefonController.text,
          'username': usernameController.text,
          // 'hashed_password': hashedPassword,
        },
      );

      if (response.statusCode == 200) {
        print("Registration successful");
      } else {
        print("Registration failed. Status code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
