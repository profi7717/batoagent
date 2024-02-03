import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(darslar());
}

class darslar extends StatefulWidget {
  const darslar({super.key});

  @override
  State<darslar> createState() => _darslarState();
}

class _darslarState extends State<darslar> {
  List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  dynamic nom = "";
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dash.vips.uz/api/11/46/1920'));

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
          Text("Darslar"),
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
                  Text('dars_nomi: ${data[index]['dars_nomi']}'),
                  Text('narxi: ${data[index]['narxi']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
