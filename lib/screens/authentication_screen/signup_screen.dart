import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:pepples_paper_review_ai/models/user.dart';
import 'package:pepples_paper_review_ai/provider/user.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/login_screen.dart';

class RegistrationForm extends StatefulWidget {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Add a form key

  RegistrationForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
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
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: widget.formKey, // Associate the form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                        ),
                        // END: username TextFormField
                        const SizedBox(
                          height: 20,
                        ),
                        // START: email address TextFormField
                        TextFormField(
                          controller: widget.emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            prefixIcon: const Icon(
                              Icons.email,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email address is required';
                            }
                            return null;
                          },
                        ),
                        // END: email address TextFormField
                        const SizedBox(
                          height: 20,
                        ),
                        // START: password TextFormField
                        TextFormField(
                          obscureText: _obscurePassword,
                          controller: widget.passwordController,
                          keyboardType: TextInputType.text,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 24,
                            ),
                            prefixIconColor: Colors.black,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        // END: password TextFormField
                        const Text(
                          'Password must be more than 8 characters',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // START: confirm password TextFormField
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm password is required';
                            } else if (value !=
                                widget.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          obscureText: _obscurePassword,
                          keyboardType: TextInputType.text,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 24,
                            ),
                            prefixIconColor: Colors.black,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
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
                            // Trigger form validation
                            if (widget.formKey.currentState!.validate()) {
                              final email = widget.emailController.text;
                              final password = widget.passwordController.text;
                              final name = widget.nameController.text;
                              final authRepository = Authentication();
                              final  data = await authRepository.signUp(
                                  email, name, password);

                              if (data != null) {
    Userdata().updateUser(data);

                                // Registration failed, display an error message
                                print('Registration not successful');

                                showSnackbar(
                                    context, Colors.black, 'SignUp successful');
                                print('sign up Email >>> ${data.email}');
                                print('sign up id >>> ${data.id}');
                                print(
                                    'sign up created at >>> ${data.createdAt}');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              } else {
                                print('errror:   eeeeeee');
                                showSnackbar(
                                    context, Colors.red, 'SignUp ERROR');
                              }
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
                                        builder: (context) => LoginScreen()));
                              },
                              child: const Text(
                                "Login Here",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
