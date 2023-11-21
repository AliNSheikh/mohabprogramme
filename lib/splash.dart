import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'animation/animation.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(scaleanimation(
          page: loginscreen()
      ), (route) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2c73d2),
              Color(0xFF0081cf),
              Color(0xFF0089ba),
              Color(0xFF008e9b),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage("images/test.gif"),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedTextKit(animatedTexts: [
                ColorizeAnimatedText("MOHAB",
                    textStyle: TextStyle(fontSize: 50,),
                    colors: [
                      Color(0xFFff9671),
                      Color(0xFFffc75f),
                      Color(0xFFf9f871),
                    ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
