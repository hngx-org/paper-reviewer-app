import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/routes/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ProjectColors.deepPurple,
              ProjectColors.minPurple,
              ProjectColors.maxLightPurple,
              ProjectColors.lightPurple,
            ],
            begin: Alignment.topCenter,
            //end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign-In",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 44,
                          color: ProjectColors.white
                          ),
                    ),
                    Text(
                      "Create an account",
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 30,
                           color: ProjectColors.white
                          ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: ProjectColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(64),
                    topRight: Radius.circular(64),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ProjectColors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: ProjectColors.maxLightPurple,
                              blurRadius: 3,
                              offset: Offset(0, 10),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: ProjectColors.white
                                            // color: Colors.grey[200]
                                            ))),
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: "Email or PhoneNumber",
                                labelStyle:
                                    TextStyle(color: ProjectColors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: ProjectColors.white
                                            // color: Colors.grey[200]
                                            ))),
                            child: TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(color: ProjectColors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: ProjectColors.white
                                            // color: Colors.grey[200]
                                            ))),
                            child: TextField(
                              controller: _confirmPasswordController,
                              decoration: const InputDecoration(
                                labelText: "Confirm Password",
                                labelStyle:
                                    TextStyle(color: ProjectColors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          
                        ]
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: ProjectColors.black),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(color: ProjectColors.black,
                          fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
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
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ProjectColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
