import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userInput = '';
  bool isVisible = true;
  TapGestureRecognizer zuriRecognizer = TapGestureRecognizer();
  TapGestureRecognizer hngRecognizer = TapGestureRecognizer();
  TapGestureRecognizer i4gRecognizer = TapGestureRecognizer();
  TextEditingController inputController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    zuriRecognizer.dispose();
    hngRecognizer.dispose();
    i4gRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HNG'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.purple[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/combined_logos.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Zuri's website",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: zuriRecognizer
                        ..onTap = () {
                          launch('https://zuri.team/');
                        }),
                ),
                RichText(
                  text: TextSpan(
                      text: "HNG's website",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: hngRecognizer
                        ..onTap = () {
                          launch('https://hng.tech/');
                        }),
                ),
                RichText(
                  text: TextSpan(
                      text: "I4G's website",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: i4gRecognizer
                        ..onTap = () {
                          launch('https://ingressive.org/');
                        }),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: isVisible,
              replacement: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.purple.shade100,
                  ),
                  child: Center(
                      child: Text(
                    userInput,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ))),
              child: TextField(
                textAlign: TextAlign.center,
                controller: inputController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.purple.shade100,
                    hintText:
                        "Click here to type anything then click on the 'Display' button",
                    hintStyle: TextStyle(color: Colors.black87, fontSize: 14)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              onPressed: () {
                setState(() {
                  userInput = inputController.text;

                  isVisible = !isVisible;
                });
              },
              child: Text(
                isVisible ? 'Display' : 'Type Again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
