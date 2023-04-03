import 'dart:async';

import 'package:covid_tracker/Models/Model1.dart';
import 'package:covid_tracker/View/countries.dart';
import 'package:covid_tracker/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void initState() {
    super.initState();

    // Dont Forget that Timer Function is very important for splash screens
    // If we want to show a screen for a specific time
    // Remember the below syntax
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => WorldTotalStats())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Use SafeArea to make ur app visible in mobile below the camera line
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                // Using Animation builder first time in flutter
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Image(image: AssetImage('images/virus.png')),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                  );
                }),
            SizedBox(
              // Always Use Media Query to adjust the height dynamically in the app
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const Align(
              // Keep the Align Widget in mind in order to align your widgets in screen
              alignment: Alignment.center,
              child: Text(
                'Covid_19\nTracker App',
                textAlign: TextAlign.center, // Important Property textAlign
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
