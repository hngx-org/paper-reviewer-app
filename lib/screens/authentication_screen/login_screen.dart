import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/signup_screen.dart';
import 'package:pepples_paper_review_ai/screens/chat_screen.dart';
import '../../constants/colors.dart';
// import '../../constants/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _userEmail;

  late final TextEditingController _userPassword;

  bool obscurePassword = true;

  Icon passwordVisibilityIcon = const Icon(Icons.visibility);

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool validateEmail({required String email}) {
    return ((email.contains('@') &&
            email.contains('.') &&
            (email.substring(email.length - 1) != '.' &&
                email.substring(email.length - 1) != '@'))) ||
        email.isEmpty;
  }

  bool checkPasswordLength(String password) {
    return password.length >= 6 || password.isEmpty;
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

  ValueNotifier isLoading = ValueNotifier(false);

  @override
  void initState() {
    _userEmail = TextEditingController();
    _userPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userEmail.dispose();
    _userPassword.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  Future<void> showAuthErrorDialog(
      BuildContext context, bool validEmail, bool validPassword) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Authentication Error"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!validEmail) const Text("A valid email is required."),
              if (!validPassword)
                const Text("Password must be at least 6 characters."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
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
                        "Welcome 👋",
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
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          const Text(
                            "Email Address",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
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
                            decoration: InputDecoration(
                              // labelText: 'Email',
                              hintText: 'example@email.com',
                              prefixIcon: const Icon(
                                Icons.mail,
                                size: 24,
                                color: ProjectColors.black,
                              ),
                              prefixIconColor:
                                  Theme.of(context).colorScheme.onBackground,
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    color: ProjectColors.black),
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
                              errorText: validateEmail(email: _userEmail.text)
                                  ? null
                                  : 'Enter a valid email',
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            focusNode: _passwordFocus,
                            obscureText: obscurePassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _userPassword,
                            onChanged: (_) {
                              setState(() {});
                            },
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              errorText: checkPasswordLength(_userPassword.text)
                                  ? null
                                  : 'Password must be at least 6 characters',
                              hintText: '******************',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: ProjectColors.black,
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
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    final toggleVisibility =
                                        setPasswordVisibility(
                                            obscureText: obscurePassword);
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
                            height: 40.0,
                          ),
                          MaterialButton(
                            onPressed: () async {
                              final email = _userEmail.text;
                              final password = _userPassword.text;

                              bool validEmail = validateEmail(email: email) &&
                                  email.isNotEmpty;

                              bool validPassword =
                                  checkPasswordLength(password) &
                                      password.isNotEmpty;

                              if (validEmail && validPassword) {
                                isLoading.value = true;
                                // await Future.delayed(
                                //     const Duration(milliseconds: 5000));

                                try {
                                  final auth = Authentication();
                                  final result = await auth.signIn(
                                      _userEmail.text, _userPassword.text);
                                  if (result['error'] == null) {
                                    isLoading.value = false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChatPage()),
                                    );
                                  } else {
                                    isLoading.value = false;
                                    print(
                                        'Email does not exist\nTry signing up instead');
                                  }
                                } on ApiException catch (e) {
                                  isLoading.value = false;
                                  print(e);
                                }
                              } else {
                                showAuthErrorDialog(
                                    context, validEmail, validPassword);
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
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ProjectColors.white,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.input_rounded,
                                  color: ProjectColors.white,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            height: 0.5,
                            color: ProjectColors.black,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignIn()));
                                  },
                                  child: const Text(
                                    "Sign up Here",
                                    style: TextStyle(
                                        color: ProjectColors.deepPurple),
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatPage()),
                              );
                            },
                            color: Colors.grey[500],
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
                                  "Continue without login in ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: ProjectColors.white,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.input_rounded,
                                  color: ProjectColors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
