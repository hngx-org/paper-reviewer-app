import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/routes/routes.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailAdressController = TextEditingController();

  final _passwordController = TextEditingController();
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
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: ProjectColors.white),
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
                              controller: _emailAdressController,
                              decoration: const InputDecoration(
                                hintText: "Email or Phone  number",
                                hintStyle:
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
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: "Password",
                                hintStyle:
                                    TextStyle(color: ProjectColors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "forgot password?",
                      style: TextStyle(color: ProjectColors.black),
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
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ProjectColors.white),
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
