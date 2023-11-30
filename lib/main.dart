import 'package:flutter/material.dart';
import 'package:ter/screens/SplashScreen.dart';
import 'package:ter/screens/Welcome.dart';
import 'package:ter/screens/Password.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Password(),
      
    );
  }
}
