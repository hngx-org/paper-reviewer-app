import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/routes/routes.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ProjectColors.black,
        appBar: AppBar(
          title:Text("Choose your Payment Option"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upgrade to Premium to Unlock All Features',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: ProjectColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.paymentMehod);
                  },
                  color: ProjectColors.black,
                  elevation: 0,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 60,
                  child: const Text(
                    " Get Premium",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ProjectColors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Basic',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                  color: ProjectColors.black
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  color: ProjectColors.black,
                  minWidth: double.infinity,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 60,
                  child: const Text(
                    "Start 14 day free Trial",
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
      ),
    );
  }
}
