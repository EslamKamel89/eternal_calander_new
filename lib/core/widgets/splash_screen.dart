import 'package:eternal_calander_new/core/extensions/context-extensions.dart';
import 'package:eternal_calander_new/core/router/app_routes_names.dart';
import 'package:eternal_calander_new/core/themes/themedata.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutesNames.dateConversionView, (_) => false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor, // Dark blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Crescent moon with a star
            Icon(
              Icons.brightness_3, // Crescent moon icon
              size: 100,
              color: lightClr.goldColor, // Gold color
            ),
            const SizedBox(height: 20),
            // Animated App Title
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'Islamic Calendar',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Subtitle
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'Organize your days with faith and ease',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
