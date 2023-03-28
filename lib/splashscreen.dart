import 'dart:async';

import 'package:bloodbank/listviewpage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () { 
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (cnxt){
      return ListViewPage();
    
    }
    ));
    });
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 0, 0),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image(image: AssetImage("assets/images/blood-donor-day-icon-hand-help-blood-donation-concept_608997-437.jpg.webp")),
          Center(
            child: Text(
              "Blood bank",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w900),
            ),
          ),
         
        ],
      )),
    );
  }
}
