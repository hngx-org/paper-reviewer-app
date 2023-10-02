import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/auth_models/auth_base_response_model.dart';

import 'package:pepples_paper_review_ai/screens/authentication_screen/login_screen.dart';
import 'package:pepples_paper_review_ai/screens/chat_screen.dart';

import '../../constants/colors.dart';
import '../../constants/routes/routes.dart';
import '../../widgets/custom_alert_box.dart';
import 'auth_models/user_model.dart';

import '../../constants/colors.dart';
import '../../constants/routes/routes.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _userEmail;
  late final TextEditingController _userPassword;
  late final TextEditingController _username;
  late final TextEditingController _userPasswordConfirmation;

  bool obscurePassword = true;
  bool obscurePasswordConfirmation = true;

  String? emailErrorText;
  String? passwordErrorText;
  String? confirmPasswordErrorText;
  String? nameErrorText;

  Icon passwordVisibilityIcon = const Icon(Icons.visibility);
  Icon confirmPasswordVisibilityIcon = const Icon(Icons.visibility);

  bool passwordsMatch = true;

  final auth = Authentication();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();

  ValueNotifier isLoading = ValueNotifier(false);

  final _formKey = GlobalKey<FormState>();

  bool validateEmail({required String email}) {
    return ((email.contains('@') && email.contains('.') && (email.substring(email.length - 1) != '.' && email.substring(email.length - 1) != '@'))) ||
        email.isEmpty;
  }

  bool checkPasswordLength(String password) {
    return password.length >= 8 || password.isEmpty;
  }

  Function setPasswordVisibility({required bool obscureText}) {
    return () {
      obscureText = !obscureText;
      return obscureText ? Icons.visibility : Icons.visibility_off;
    };
  }

  bool checkPasswordsMatch({
    required String password,
    required String passwordConfirmation,
  }) {
    return password == passwordConfirmation || passwordConfirmation.isEmpty;
  }

  @override
  void initState() {
    _userEmail = TextEditingController();
    _userPassword = TextEditingController();
    _username = TextEditingController();
    _userPasswordConfirmation = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userEmail.dispose();
    _userPassword.dispose();
    _username.dispose();
    _userPasswordConfirmation.dispose();

    _usernameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoading,
      builder: (context, value, _) {
        return
            Scaffold(
              body: Container(
                padding: const EdgeInsets.only(top: 50),
                color: ProjectColors.black,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Create your Paper Review \nAi account ✍",
                          style: TextStyle(
                            fontSize: 28,
                            color: ProjectColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: ProjectColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              )),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Full name",
                                  style: TextStyle(fontSize: 20,),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  focusNode: _usernameFocus,
                                  onEditingComplete: () {
                                    _emailFocus.requestFocus();
                                  },
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.name,
                                  controller: _username,
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      nameErrorText = "Please enter your full name";
                                      setState(() {});
                                      return nameErrorText;
                                    }

                                    nameErrorText = null;
                                    setState(() {});
                                    return nameErrorText;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',

                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 24,                                  ),
                                    prefixIconColor: ProjectColors.black,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: ProjectColors.black),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    errorText: nameErrorText,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  "Email",
                                  style: TextStyle(fontSize: 20, ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  focusNode: _emailFocus,
                                  onEditingComplete: () {
                                    _passwordFocus.requestFocus();
                                  },
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _userEmail,
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      emailErrorText = "Please enter your email";
                                      setState(() {});
                                      return emailErrorText;
                                    }

                                    if (!validateEmail(email: value)) {
                                      emailErrorText = "Enter a valid email";
                                      setState(() {});
                                      return emailErrorText;
                                    }

                                    emailErrorText = null;
                                    setState(() {});
                                    return emailErrorText;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'example@email.com',
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      size: 24,
                                    ),
                                    prefixIconColor: ProjectColors.black,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: ProjectColors.black),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    errorText: emailErrorText,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                const Text(
                                  "Password",
                                  style: TextStyle(fontSize: 20, ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  focusNode: _passwordFocus,
                                  obscureText: obscurePassword,
                                  onEditingComplete: () {
                                    _confirmPasswordFocus.requestFocus();
                                  },
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  controller: _userPassword,
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      passwordErrorText = "Please enter your password";
                                      setState(() {});
                                      return passwordErrorText;
                                    }

                                    if (value.contains(" ")) {
                                      passwordErrorText = "Password must not contain whitespaces";
                                      setState(() {});
                                      return passwordErrorText;
                                    }

                                    if (value.trim().length < 6) {
                                      passwordErrorText = "Password must be at least 6 characters";
                                      setState(() {});
                                      return passwordErrorText;
                                    }

                                    passwordErrorText = null;
                                    setState(() {});
                                    return passwordErrorText;
                                  },
                                  decoration: InputDecoration(
                                    errorText: passwordErrorText,
                                    hintText: '************',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 24,
                                    ),
                                    prefixIconColor: ProjectColors.black,
                                    suffixIconColor: ProjectColors.black,
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: ProjectColors.black),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          final toggleVisibility = setPasswordVisibility(obscureText: obscurePassword);
                                          obscurePassword = !obscurePassword;
                                          final newIconData = toggleVisibility();
                                          passwordVisibilityIcon = Icon(newIconData);
                                        });
                                      },
                                      icon: passwordVisibilityIcon,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  "Confirm Password",
                                  style: TextStyle(fontSize: 20, ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  focusNode: _confirmPasswordFocus,
                                  obscureText: obscurePasswordConfirmation,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  controller: _userPasswordConfirmation,
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  onTapOutside: (event) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      confirmPasswordErrorText = "Please enter your password";
                                      setState(() {});
                                      return confirmPasswordErrorText;
                                    }

                                    if (value.contains(" ")) {
                                      confirmPasswordErrorText = "Password must not contain whitespaces";
                                      setState(() {});
                                      return confirmPasswordErrorText;
                                    }

                                    if (_userPassword.text != value) {
                                      confirmPasswordErrorText = "! Password Mismatch";
                                      setState(() {});
                                      return confirmPasswordErrorText;
                                    }

                                    confirmPasswordErrorText = null;
                                    setState(() {});
                                    return confirmPasswordErrorText;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 24,
                                    ),
                                    prefixIconColor: ProjectColors.black,
                                    suffixIconColor: ProjectColors.black,
                                    filled: true,
                                    fillColor: Colors.grey.shade300,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: const BorderSide(color: ProjectColors.black),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          final toggleConfirmVisibility = setPasswordVisibility(obscureText: obscurePasswordConfirmation);
                                          obscurePasswordConfirmation = !obscurePasswordConfirmation;
                                          final newIconData = toggleConfirmVisibility();
                                          confirmPasswordVisibilityIcon = Icon(newIconData);
                                        });
                                      },
                                      icon: confirmPasswordVisibilityIcon,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                MaterialButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      try {
                                        isLoading.value = true;
                                        final result = await auth.signUp(
                                          _userEmail.text,
                                          _username.text,
                                          _userPassword.text,
                                        );
                                        final response = AuthBaseResponseModel.fromJson(result);
                                        if (response.error != null) {
                                          isLoading.value = false;
                                          if (mounted) {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CustomAlertDialog(
                                                  title: 'Error',
                                                  message: response.message,
                                                  onConfirm: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          final user = User.fromJson(response.data);
                                          // storage.saveUser(user.toJson());toJson
                                          isLoading.value = false;
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));

                                        }
                                      } catch (e) {
                                        isLoading.value = false;
                                        if (mounted) {
                                          print('already mounted');

                                        }
                                      }
                                    }
                                  },
                                  color: ProjectColors.black,
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
                                            color: ProjectColors.white,
                                            fontSize: 24
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Icon(Icons.app_registration, color: ProjectColors.white,)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Already have an account?'),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                                      },
                                      child: Text(
                                        "Login Here",
                                        style: TextStyle(color: ProjectColors.deepPurple),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            );


      },
    );
  }
}
// if (value) const CircularProgressIndicator()
