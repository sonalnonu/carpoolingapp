import 'dart:async';

import 'package:carpooling/SizeConfig.dart';
import 'package:carpooling/ipaddress.dart';
import 'package:carpooling/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const ippage())));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.white,
       body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              width: SizeConfig.screenwidth,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/carpooling.jpg',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Share ride, make friends" 
                       ,
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        });
      }),

    );
  }
}