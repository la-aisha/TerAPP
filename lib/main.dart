import 'package:flutter/material.dart';
import 'package:ter/provider/authprovider.dart';
import 'package:ter/screens/SplashScreen.dart';
import 'package:ter/screens/Welcome.dart';
import 'package:ter/screens/Password.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      //ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider()),
      ChangeNotifierProvider<MyAuthProvider>(create: (_) => MyAuthProvider()),

      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Password(),
        
      ),
    );
  }
}
