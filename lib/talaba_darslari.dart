import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(talaba_darslar());
}

class talaba_darslar extends StatefulWidget {
  const talaba_darslar({super.key});

  @override
  State<talaba_darslar> createState() => _talaba_darslarState();
}

class _talaba_darslarState extends State<talaba_darslar> {
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  dynamic nom = "";
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dash.vips.uz/api/11/46/2428'));

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
          Text("Talaba darslar"),
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
                  Text('dars_id: ${data[index]['dars_id']}'),
                  Text('talaba_id: ${data[index]['talaba_id']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
