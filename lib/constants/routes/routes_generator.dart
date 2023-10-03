import 'package:flutter/material.dart';

import '../../screens/authentication_screen/login_screen.dart';
import '../../screens/authentication_screen/register_screen.dart';
// import '../../screens/authentication_screen/signup_screen.dart';
import '../../screens/chat_screen.dart';
import '../../screens/history_screen.dart';
import '../../screens/payment_screen/payment.dart';
import '../../screens/payment_screen/payment_method.dart';
import '../../screens/splash_screen.dart';
import '../colors.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(const SplashScreen(), settings: settings);
      case AppRoutes.register:
        return buildRoute(const RegisterScreen(), settings: settings);
      case AppRoutes.login:
        return buildRoute(const LoginScreen(), settings: settings);
      case AppRoutes.signup:
        return buildRoute(const RegisterScreen(), settings: settings);
      case AppRoutes.payment:
        return buildRoute(const PaymentScreen(), settings: settings);
      case AppRoutes.paymentMehod:
        return buildRoute(const PaymentMehodScreen(), settings: settings);
      case AppRoutes.chat:
        return buildRoute(const ChatPage(), settings: settings);
      case AppRoutes.history:
        return buildRoute(const HistoryScreen(), settings: settings);
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor:ProjectColors.deepPurple,
          title: const Text(
            'ERROR!!',
            style: TextStyle(
              color: ProjectColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 450.0, width: 450.0, child: Text("Error")),
                Text(
                  'Seems the route you\'ve navigated to doesn\'t exist!!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
