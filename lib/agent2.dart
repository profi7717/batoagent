import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Type API Example',
      home: MapTypeAPIExample(),
    );
  }
}

class MapTypeAPIExample extends StatefulWidget {
  @override
  _MapTypeAPIExampleState createState() => _MapTypeAPIExampleState();
}

class _MapTypeAPIExampleState extends State<MapTypeAPIExample> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  dynamic nom = "";
  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://dash.vips.uz/api/11/46/1919?id=$staffid'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      final List<dynamic> jsonData = json.decode(response.body);

      for (var item in jsonData) {
        data.add(Map<String, dynamic>.from(item));
        // nom = (item["name"]);
        // print(nom);
      }

      setState(() {});
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  var staffid = '';
  void xodim() async {
    staffid = await SessionManager().get("staffid");
  }

  //  @override
  // void initState() {
  //   super.initState();
  //   // Initialize anything that needs to be set up when the widget is created
  //   // For example, initializing variables, setting up listeners, etc.
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        toolbarHeight: 100,
        title: Row(children: [
          Text("Agent"),
        ]),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Text('id: ${data[index]['id']}'),
                  Text('name: ${data[index]['name']}'),
                  Text('rasm: ${data[index]['rasm']}'),
                  Text('adresi: ${data[index]['adresi']}'),
                  Text('tel_raqami: ${data[index]['tel_raqami']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
