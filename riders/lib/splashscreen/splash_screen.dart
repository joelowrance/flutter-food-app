import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riders/authentication/auth_screen.dart';
import 'package:riders/mainScreens/home_screen.dart';

import '../global/global.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 8), () async {
      if (firebaseAuth.currentUser != null) {
        Navigator.push(context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (c) => const AuthScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "Worlds Largest Online Food App",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 30, fontFamily: "Signatra", letterSpacing: 2),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
