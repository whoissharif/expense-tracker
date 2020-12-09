import './screens/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.green),
        primarySwatch: Colors.green,
        accentColor: Colors.deepOrangeAccent,
        buttonColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        
      ),
      home: Homepage(),
    );
  }
}
