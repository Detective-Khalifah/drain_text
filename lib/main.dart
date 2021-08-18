import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:drain_text/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Drain Text'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _canEdit = true;
  TextEditingController _inputController = TextEditingController();
  TextEditingController _displayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              controller: _inputController,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Input some text here'),

              /// only allow input after clearing displayed text; disable input when viewing input text
              enabled: _canEdit ? true : false,
              keyboardType: TextInputType.text,
              style: Theme.of(context).textTheme.headline4,
            ),
            Material(
              elevation: 5.0,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    reverseTextFieldStates();
                  });
                },
                minWidth: 300.0,
                height: 40.0,
                child: Text(
                  _canEdit ? 'View' : 'Edit',
                ),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _displayController,
                decoration: kTextFieldDecoration,
                enabled: false,
                maxLines: 12,
                readOnly: true,
              ),
            ),
            SizedBox(
              height: 20,
              width: 200.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  color: Colors.blue,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Detective_Khalifah',
                        speed: const Duration(milliseconds: 250),
                        textAlign: TextAlign.center),
                  ],
                  displayFullTextOnTap: true,
                  repeatForever: true,
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void reverseTextFieldStates() {
    switch (_canEdit) {
      case false:
        _displayController.clear();
        break;
      case true:
        _displayController.text = 'Typed Text: ' + _inputController.text;
        _inputController.clear();
        break;
    }
    _canEdit = !_canEdit;
  }
}
