import 'package:flutter/material.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/splash_screen.dart';
import 'package:pepples_paper_review_ai/screens/chat_screen.dart';
import 'package:pepples_paper_review_ai/screens/payment_screen/payment.dart';

void main() {
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
        '/': (context) => const PaymentScreen(),
        '/firstScreen': (context) => const ChatPage(),
        // '/secondScreen': (context) => SecondScreen(),
        // '/thirdScreen': (context) => ThirdScreen(),
      },
    );
  }
}
