import 'package:flutter/material.dart';
import 'package:pepples_paper_review_ai/provider/user.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/splash_screen.dart';
import 'package:pepples_paper_review_ai/screens/chat_screen.dart';
import 'package:pepples_paper_review_ai/screens/payment_screen/payment.dart';
import 'package:pepples_paper_review_ai/screens/payment_screen/payment_hng.dart';
import 'package:pepples_paper_review_ai/screens/payment_screen/payment_method.dart';

void main() {
  Userdata().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/firstScreen': (context) => const SplashScreen(),
        '/payment': (context) => const PaymentScreen(),
        '/paymentMehod': (context) => const PaymentMehodScreen(),
        '/paymenthng': (context) => const PaymentHng(),

        // '/secondScreen': (context) => SecondScreen(),
        // '/thirdScreen': (context) => ThirdScreen(),
      },
    );
  }
}
