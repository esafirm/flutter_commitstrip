import 'package:flutter/material.dart';
import 'mainscreen/main_screen.dart';

import 'test/Testis.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CommitStrip',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("CommitStrip"),
        ),
        body: MainScreen(),
      ),
    );
  }
}
