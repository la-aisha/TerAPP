import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ter/screens/Welcome.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Welcome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ter1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(
                  0, 0, 0, 0.88), // Set the overlay color and opacity
            ),
            Center(
              child: Image.asset(
                'images/logoter.png',
                width: 256,
                height: 100,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
