import 'package:flutter/material.dart';
import 'package:in_app_payment/in_app_payment.dart';
import 'package:pepples_paper_review_ai/constants/colors.dart';

import '../../provider/user.dart';

class PaymentHng extends StatefulWidget {
  const PaymentHng({super.key});
  // final String title;
  @override
  State<PaymentHng> createState() => _PaymentHngState();
}

class _PaymentHngState extends State<PaymentHng> {
  final pay = HNGPay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ProjectColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pay.googlePay(context,
                amountToPay: '45', userID: Userdata().userdata.id),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: GestureDetector(
                child: Container(
                  // height: 48,
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ProjectColors.black,
                  ),
                  child: const Text(
                    "Pay With Apple Pay",
                    style: TextStyle(
                      color: ProjectColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}