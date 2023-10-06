import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ProjectColors.deepPurple,
                ProjectColors.minPurple,
                ProjectColors.maxLightPurple,
                ProjectColors.minLightPurple,
                ProjectColors.lightPurple,
              ],
              stops: [0.1, 0.3, 0.5, 0.7, 0.9],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                " Welcome to Pebbles ",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: ProjectColors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Dive Into Knowledge",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ProjectColors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.chat);
                },
                color: ProjectColors.deepPurple,
                minWidth: double.infinity,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 60,
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ProjectColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
