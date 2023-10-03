import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/login_screen.dart';

class RegistrationForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const RegistrationForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),

            const Text(
              "Create your Paper Review \nAi account ✍",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // START: username TextFormField
                      TextFormField(
                        controller: widget.nameController,
                        keyboardType: TextInputType.name,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Username',
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 24,
                          ),
                          prefixIconColor: Colors.black,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ),
                      // END: username TextFormField
                      const SizedBox(
                        height: 20,
                      ),
                      // START: email address TextFormField
                      TextFormField(
                        controller: widget.emailController,
                        keyboardType: TextInputType.name,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'email address',
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 24,
                          ),
                          prefixIconColor: Colors.black,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ),
                      // END: email address TextFormField
                      const SizedBox(
                        height: 20,
                      ),
                      // START: password TextFormField
                      TextFormField(
                        obscureText: true,
                        controller: widget.passwordController,
                        keyboardType: TextInputType.name,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'password',
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 24,
                          ),
                          prefixIconColor: Colors.black,
                          suffixIcon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ),
                      // END: password TextFormField
                      const SizedBox(
                        height: 20,
                      ),
                      // START: confirm password TextFormField
                      TextFormField(
                        validator: (val) {
                          if (val?.isEmpty ?? true) {
                            return 'Please enter your password';
                          } else if ((val?.length ?? 0) < 6) {
                            return 'Password is not up to 6 characters';
                          } else if (((val?.length ?? 0) >= 6) &&
                              ((val ?? "") != widget.passwordController.text)) {
                            return "Password texts don't match";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        keyboardType: TextInputType.name,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'confirm password',
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 24,
                          ),
                          prefixIconColor: Colors.black,
                          suffixIcon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                      ),
                      // END: confirm password TextFormField

                      const SizedBox(
                        height: 20,
                      ),

                      // START: Register button
                      MaterialButton(
                        onPressed: () async {
                          final email = (widget.emailController).text;
                          final password = (widget.passwordController).text;
                          final name = widget.nameController.text;
                          final authRepository = Authentication();
                          final data = await authRepository.signUp(
                              email, name, password);
                          if (data != null) {
                            // Registration failed, display an error message
                            print('Registration not successful');

                            showSnackbar(
                                context, Colors.black, 'SignUp successful');
                            print('sign up Email >>> ${data.email}');
                            print('sign up id >>> ${data.id}');
                            print('sign up created at >>> ${data.createdAt}');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          } else {
                            print('errror:   eeeeeee');
                            showSnackbar(context, Colors.red, 'SignUp ERROR');
                          }
                        },
                        color: Colors.black,
                        minWidth: double.infinity,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.app_registration,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            const SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                "Login Here",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),

            // END: Register button
          ],
        ),
      ),
    );
  }
}
