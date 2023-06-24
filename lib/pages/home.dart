import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleTranslator translator = GoogleTranslator();
  TextEditingController TextController = TextEditingController();
  String InputText = "Test the Language translator";
  String OutputText = "";
  String _selectedOption = 'ur';

  void translate() {
    translator.translate(TextController.text, to: _selectedOption).then((output) {
      setState(() {
        OutputText = output.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Language Translator"),
      ),
      body: Container(
          width: Get.width * 10,
          height: Get.height * 9,
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: TextController,
                              decoration: InputDecoration(
                                hintText: 'Enter text',
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Center(
                            child: DropdownButton<String>(
                            onChanged: (value) {
                              setState(() {
                                _selectedOption = value!;
                              });
                            },
                            value: _selectedOption,
                            items: <String, String>{
                              'Urdu': 'ur',
                              'Arabic': 'ar',
                              'English-UK': 'en-GB',
                            }.entries.map<DropdownMenuItem<String>>((entry) {
                              return DropdownMenuItem<String>(
                                value: entry.value,
                                child: Center(
                                  child:Text(entry.key),
                                )
                              );
                            }).toList(),
                          ),
                          )
                        ),
                       
                        FloatingActionButton.extended(
                            onPressed: () {
                              translate();
                            },
                            backgroundColor: Colors.blueGrey,
                            label: Text(
                              "Translate",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 320,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1.0,
                              )),
                          child: Center(
                            child: Text(
                              OutputText,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]))),
    );
  }
}
