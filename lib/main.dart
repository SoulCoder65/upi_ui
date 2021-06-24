import 'package:flutter/material.dart';
//Screens
import 'Screens/homePage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'UPI UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.transparent,

      ),
      home: HomePage(),
    );
  }
}

