// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String? selectedOriginValue;
  String? selectedDestinationValue;
  final List<String> options = ['English', 'Nepali', 'Hindi'];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getLanguageCode(String language) {
    if (language == 'English') {
      return "en";
    } else if (language == 'Nepali') {
      return "ne";
    } else if (language == 'Hindi') {
      return "hi";
    }
    return "--";
  }

  void translate(String src, String dest, String input) async {
    if (src == "--" || dest == "--") {
      setState(() {
        output = "Failed to translate";
      });
      return;
    }

    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
  }

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
                  DropdownButton<String>(
                    value: selectedOriginValue,
                    hint: Text("From"),
                    items: options.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        originLanguage = newValue!;
                        selectedOriginValue = newValue;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    dropdownColor: Colors.deepPurple[50],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  DropdownButton<String>(
                    value: selectedDestinationValue,
                    hint: Text("To"),
                    items: options.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        destinationLanguage = newValue!;
                        selectedDestinationValue = newValue;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    dropdownColor: Colors.deepPurple[50],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
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
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            translate(
                                _getLanguageCode(originLanguage),
                                _getLanguageCode(destinationLanguage),
                                _controller.text.toString());
                          }
                        },
                        child: Text('Translate'),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "\n$output",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
