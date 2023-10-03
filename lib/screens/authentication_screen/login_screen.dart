import 'package:flutter/material.dart';
import 'package:hng_authentication/authentication.dart';
import 'package:hng_authentication/widgets/widget.dart';
import 'package:pepples_paper_review_ai/screens/authentication_screen/signup_screen.dart';
import 'package:pepples_paper_review_ai/screens/chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/colors.dart';
// import '../../constants/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Check if the user is remembered
    checkRememberedUser();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> checkRememberedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final rememberedEmail = prefs.getString('email');
    final rememberedPassword = prefs.getString('password');

    if (rememberedEmail != null && rememberedPassword != null) {
      // Automatically fill the email and password fields
      _emailController.text = rememberedEmail;
      _passwordController.text = rememberedPassword;

      // Directly navigate to the ChatPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ChatPage(),
        ),
      );
    }
  }

  Future<void> handleLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final authRepository = Authentication();
    final data = await authRepository.signIn(email, password);

    if (data != null) {
      // Remember the user after successful login
      await rememberUser(email, password);
      showSnackbar(context, Colors.black, 'Login successful');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ChatPage()));
    } else {
      print('Login error');
      // Handle login error...
      showSnackbar(context, Colors.black, 'Login Failed - contact admin');
    }
  }

  Future<void> rememberUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                        const SizedBox(
                          height: 20,
                        ),
                        // START: email address TextFormField
                        TextFormField(
                          controller: _emailController,
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
                          controller: _passwordController,
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

                        const SizedBox(
                          height: 20,
                        ),

                        // START: Login button
                        MaterialButton(
                          onPressed: () async {
                            handleLogin();
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
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.login,
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
                              const Text("Don't have an account?"),
                              const SizedBox(
                                width: 5.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegistrationForm(
                                        nameController: nameController,
                                        emailController: emailController,
                                        passwordController: passwordController,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Sign up Here",
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
        ));
  }
}
