import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/routes/routes.dart';


class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Upgrade to Premium to Unlock All Features',
                       
                        textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25,
                    color: ProjectColors.black,
                     fontWeight: FontWeight.bold,
                    ),
                    
                        ),
                        SizedBox(height: 30,),
                        MaterialButton(onPressed: (){
                          Navigator.pushNamed(context, AppRoutes.paymentMehod);
                        },
                        color:  ProjectColors.deepPurple,
                        elevation: 0,
                        minWidth: double.infinity,
                       shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 60,
                        child: const Text("Upgrade to Premium",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ProjectColors.white,
                        ),
                        ),
                        ),
                        const SizedBox(height: 50,),
                        const Text(
                    'Continue Free Trial',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold
                    ),),
                     SizedBox(height: 30,),
                         MaterialButton(onPressed: (){
                            Navigator.pushNamed(context, AppRoutes.register);
                          },
                          color:  ProjectColors.deepPurple,
                        minWidth: double.infinity,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 60,
                        child: const Text("Continue with Free Trial",
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