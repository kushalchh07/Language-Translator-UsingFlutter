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
  final List<String> options = [
    'English',
    'Nepali',
    'Hindi',
    'Afrikaans',
    'Albanian',
    'Amharic',
    'Arabic',
    'Armenian',
    'Azerbaijani',
    'Basque',
    'Belarusian',
    'Bengali',
    'Bosnian',
    'Bulgarian',
    'Catalan',
    'Cebuano',
    'Chichewa',
    'Chinese (Simplified)',
    'Chinese (Traditional)',
    'Corsican',
    'Croatian',
    'Czech',
    'Danish',
    'Dutch',
    'Esperanto',
    'Estonian',
    'Filipino',
    'Finnish',
    'French',
    'Frisian',
    'Galician',
    'Georgian',
    'German',
    'Greek',
    'Gujarati',
    'Haitian Creole',
    'Hausa',
    'Hawaiian',
    'Hebrew',
    'Hmong',
    'Hungarian',
    'Icelandic',
    'Igbo',
    'Indonesian',
    'Irish',
    'Italian',
    'Japanese',
    'Javanese',
    'Kannada',
    'Kazakh',
    'Khmer',
    'Kinyarwanda',
    'Korean',
    'Kurdish (Kurmanji)',
    'Kyrgyz',
    'Lao',
    'Latin',
    'Latvian',
    'Lithuanian',
    'Luxembourgish',
    'Macedonian',
    'Malagasy',
    'Malay',
    'Malayalam',
    'Maltese',
    'Maori',
    'Marathi',
    'Mongolian',
    'Myanmar (Burmese)',
    'Norwegian',
    'Odia (Oriya)',
    'Pashto',
    'Persian',
    'Polish',
    'Portuguese',
    'Punjabi',
    'Romanian',
    'Russian',
    'Samoan',
    'Scots Gaelic',
    'Serbian',
    'Sesotho',
    'Shona',
    'Sindhi',
    'Sinhala',
    'Slovak',
    'Slovenian',
    'Somali',
    'Spanish',
    'Sundanese',
    'Swahili',
    'Swedish',
    'Tajik',
    'Tamil',
    'Tatar',
    'Telugu',
    'Thai',
    'Turkish',
    'Turkmen',
    'Ukrainian',
    'Urdu',
    'Uyghur',
    'Uzbek',
    'Vietnamese',
    'Welsh',
    'Xhosa',
    'Yiddish',
    'Yoruba',
    'Zulu'
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return "en";
      case 'Nepali':
        return "ne";
      case 'Hindi':
        return "hi";
      case 'Afrikaans':
        return "af";
      case 'Albanian':
        return "sq";
      case 'Amharic':
        return "am";
      case 'Arabic':
        return "ar";
      case 'Armenian':
        return "hy";
      case 'Azerbaijani':
        return "az";
      case 'Basque':
        return "eu";
      case 'Belarusian':
        return "be";
      case 'Bengali':
        return "bn";
      case 'Bosnian':
        return "bs";
      case 'Bulgarian':
        return "bg";
      case 'Catalan':
        return "ca";
      case 'Cebuano':
        return "ceb";
      case 'Chichewa':
        return "ny";
      case 'Chinese (Simplified)':
        return "zh";
      case 'Chinese (Traditional)':
        return "zh-TW";
      case 'Corsican':
        return "co";
      case 'Croatian':
        return "hr";
      case 'Czech':
        return "cs";
      case 'Danish':
        return "da";
      case 'Dutch':
        return "nl";
      case 'Esperanto':
        return "eo";
      case 'Estonian':
        return "et";
      case 'Filipino':
        return "tl";
      case 'Finnish':
        return "fi";
      case 'French':
        return "fr";
      case 'Frisian':
        return "fy";
      case 'Galician':
        return "gl";
      case 'Georgian':
        return "ka";
      case 'German':
        return "de";
      case 'Greek':
        return "el";
      case 'Gujarati':
        return "gu";
      case 'Haitian Creole':
        return "ht";
      case 'Hausa':
        return "ha";
      case 'Hawaiian':
        return "haw";
      case 'Hebrew':
        return "he";
      case 'Hmong':
        return "hmn";
      case 'Hungarian':
        return "hu";
      case 'Icelandic':
        return "is";
      case 'Igbo':
        return "ig";
      case 'Indonesian':
        return "id";
      case 'Irish':
        return "ga";
      case 'Italian':
        return "it";
      case 'Japanese':
        return "ja";
      case 'Javanese':
        return "jv";
      case 'Kannada':
        return "kn";
      case 'Kazakh':
        return "kk";
      case 'Khmer':
        return "km";
      case 'Kinyarwanda':
        return "rw";
      case 'Korean':
        return "ko";
      case 'Kurdish (Kurmanji)':
        return "ku";
      case 'Kyrgyz':
        return "ky";
      case 'Lao':
        return "lo";
      case 'Latin':
        return "la";
      case 'Latvian':
        return "lv";
      case 'Lithuanian':
        return "lt";
      case 'Luxembourgish':
        return "lb";
      case 'Macedonian':
        return "mk";
      case 'Malagasy':
        return "mg";
      case 'Malay':
        return "ms";
      case 'Malayalam':
        return "ml";
      case 'Maltese':
        return "mt";
      case 'Maori':
        return "mi";
      case 'Marathi':
        return "mr";
      case 'Mongolian':
        return "mn";
      case 'Myanmar (Burmese)':
        return "my";
      case 'Norwegian':
        return "no";
      case 'Odia (Oriya)':
        return "or";
      case 'Pashto':
        return "ps";
      case 'Persian':
        return "fa";
      case 'Polish':
        return "pl";
      case 'Portuguese':
        return "pt";
      case 'Punjabi':
        return "pa";
      case 'Romanian':
        return "ro";
      case 'Russian':
        return "ru";
      case 'Samoan':
        return "sm";
      case 'Scots Gaelic':
        return "gd";
      case 'Serbian':
        return "sr";
      case 'Sesotho':
        return "st";
      case 'Shona':
        return "sn";
      case 'Sindhi':
        return "sd";
      case 'Sinhala':
        return "si";
      case 'Slovak':
        return "sk";
      case 'Slovenian':
        return "sl";
      case 'Somali':
        return "so";
      case 'Spanish':
        return "es";
      case 'Sundanese':
        return "su";
      case 'Swahili':
        return "sw";
      case 'Swedish':
        return "sv";
      case 'Tajik':
        return "tg";
      case 'Tamil':
        return "ta";
      case 'Tatar':
        return "tt";
      case 'Telugu':
        return "te";
      case 'Thai':
        return "th";
      case 'Turkish':
        return "tr";
      case 'Turkmen':
        return "tk";
      case 'Ukrainian':
        return "uk";
      case 'Urdu':
        return "ur";
      case 'Uyghur':
        return "ug";
      case 'Uzbek':
        return "uz";
      case 'Vietnamese':
        return "vi";
      case 'Welsh':
        return "cy";
      case 'Xhosa':
        return "xh";
      case 'Yiddish':
        return "yi";
      case 'Yoruba':
        return "yo";
      case 'Zulu':
        return "zu";
      default:
        return "--";
    }
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
        title: Text(
          "Language Translator",
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: selectedOriginValue,
                      hint: Text(
                        "From",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      items: options.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          originLanguage = newValue!;
                          selectedOriginValue = newValue;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.white),
                      iconSize: 28,
                      elevation: 16,
                      style: TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.deepPurple[50],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    DropdownButton<String>(
                      value: selectedDestinationValue,
                      hint: Text(
                        "To",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      items: options.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          destinationLanguage = newValue!;
                          selectedDestinationValue = newValue;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.white),
                      iconSize: 28,
                      elevation: 16,
                      style: TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
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
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear, color: Colors.white),
                              onPressed: () {
                                _controller.clear();
                              },
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
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
                                _controller.text.toString(),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.deepPurple,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            'Translate',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "\n$output",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
