// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var originLanguage = "From";
  var destinationLanguage = "To";
  TextEditingController languageController = TextEditingController();

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
                  CustomDropdownButtonExample(
                    language: Text("From").toString(),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(Icons.arrow_right_alt_outlined),
                  SizedBox(
                    width: 40,
                  ),
                  CustomDropdownButtonExample(
                    language: Text("To").toString(),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormFieldExample()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropdownButtonExample extends StatefulWidget {
  final String language;
  CustomDropdownButtonExample({
    super.key,
    required this.language,
  });
  @override
  _CustomDropdownButtonExampleState createState() =>
      _CustomDropdownButtonExampleState();
}

class _CustomDropdownButtonExampleState
    extends State<CustomDropdownButtonExample> {
  var output = "";
  String? selectedValue;
  final List<String> options = ['English', 'Nepali', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: selectedValue,
        hint: Text("Select Options"),
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
    );
  }
}

class CustomTextFormFieldExample extends StatefulWidget {
  @override
  _CustomTextFormFieldExampleState createState() =>
      _CustomTextFormFieldExampleState();
}

class _CustomTextFormFieldExampleState
    extends State<CustomTextFormFieldExample> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your text here',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Translate'),
            ),
          ],
        ),
      ),
    );
  }
}
