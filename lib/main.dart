import 'package:flutter/material.dart';
import './List.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to my butt',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome to my butt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _fartCounter = 0;


  void _incrementCounter() {
    setState(() {
      _fartCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have farted the button this many times:',
            ),
            Text(
              '$_fartCounter',
              style: Theme.of(context).textTheme.headline4,
            ),

            Checkbox(
              value: false,
              onChanged: (bool newValue) {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (ctxt) => new ListScreen()),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Button("Fart The Button", _incrementCounter),
    );
  }
}

Widget Button(title, functionality) {
  return InkWell(
    onTap: () {
      functionality();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 18.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0.0, 32.0)),
          ],
          borderRadius: new BorderRadius.circular(36.0),
          gradient: LinearGradient(begin: FractionalOffset.centerLeft,
// Add one stop for each color. Stops should increase from 0 to 1
              stops: [
                0.2,
                1
              ], colors: [
                Color(0xff000000),
                Color(0xff434343),
              ])),
      child: Text(
        title,
        style: TextStyle(
            color: Color(0xffF1EA94),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'),
      ),
    ),
  );
}
