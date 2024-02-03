import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(talaba());
}

class talaba extends StatefulWidget {
  const talaba({super.key});

  @override
  State<talaba> createState() => _talabaState();
}

class _talabaState extends State<talaba> {
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  dynamic nom = "";
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dash.vips.uz/api/11/46/2511'));

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        toolbarHeight: 100,
        title: Row(children: [
          Text("Talab"),
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
                  Text('boshlagan_kun: ${data[index]['boshlagan_kun']}'),
                  Text('adresi: ${data[index]['adresi']}'),
                  Text('tel_raqami: ${data[index]['tel_raqami']}'),
                  Text('agent_id: ${data[index]['agent_id']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
