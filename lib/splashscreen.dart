import 'package:flutter/material.dart';

import 'package:to_do_list/mainpage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Adjust the duration as needed
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159, // 2 * Pi radians is a full rotation
    ).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Navigate to the next screen after the animation completes
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        }
      });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(202, 117, 221, 244), // Light Green
              Color.fromARGB(255, 50, 156, 205), // Light Blue
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value,
                child: Icon(
                  Icons.local_activity_rounded,
                  size: 200.0,
                  color: Colors.black,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
