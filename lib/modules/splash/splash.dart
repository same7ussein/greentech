import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greentech/modules/on_boarding/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardingPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const SizedBox(height: 50,),
          Image.asset('assets/images/Icon-03.png'),
          const Text("Green Tech",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Color.fromARGB(255, 52, 113, 53))),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("Heart Of Perfect Farming",style:TextStyle(fontSize: 20,color: Colors.green)),
          ),
        ],

      ),
    );
  }
}
