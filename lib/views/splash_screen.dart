import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, PageTransition(child: const Login(), type: PageTransitionType.rightToLeft,
          duration: const Duration(seconds: 2),
      ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.2,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/images/sclogo.png',height: size.height * 0.30,),
          ),
          SizedBox(height: size.height * 0.2,),
          const SpinKitRing(color: Color(0xff018082),size: 50,)
        ],
      ),
    );
  }
}
