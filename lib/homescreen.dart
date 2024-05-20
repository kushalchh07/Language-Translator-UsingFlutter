// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Translator"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomDropdownButtonExample(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropdownButtonExample extends StatefulWidget {
  @override
  _CustomDropdownButtonExampleState createState() =>
      _CustomDropdownButtonExampleState();
}

class _CustomDropdownButtonExampleState
    extends State<CustomDropdownButtonExample> {
  String? selectedValue;
  final List<String> options = ['English', 'Nepali', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom DropdownButton Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text('Select an option'),
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          dropdownColor: Colors.deepPurple[50],
        ),
      ),
    );
  }
}
