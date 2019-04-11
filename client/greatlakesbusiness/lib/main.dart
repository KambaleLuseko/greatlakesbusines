import 'package:flutter/material.dart';
import 'login.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'newMaison.dart';
import 'loader.dart';
import 'listeMaisons.dart';
import 'dart:async';
import 'detailsAppart_location.dart';
import 'consulter.dart';


void main()
{
  // SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: Colors.lightBlue,
        accentColor: Colors.lightBlue
      ),
      home: loaderPage(),
    );
  }
}