import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:pepples_paper_review_ai/screens/chat_model.dart';
import 'package:hngx_openai/repository/openai_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart';
import 'authentication_screen/splash_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Message> messages = [];
  bool isTyping = false;
  final String _counter = "No Chat";

  void _handleLogout() async {
    // Clear user data from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');

    // Navigate to the login screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            const SplashScreen(), // Replace with your login screen widget
      ),
    );
  }

  void _incrementCounter() async {
    // Retrieve the user cookie from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final String? userCookie = prefs.getString('user_cookie');
    final String? cookieUser = userCookie;

    const String cookie =
        "session=ffec465a-f65f-4361-a3fe-405b7f74cd53.hA01CgZtBnU9yV3_BrdUfO7pj70";

    // Get the user input using controller.text
    String userInput = controller.text;

    // Check if the user input is empty
    if (userInput.isNotEmpty) {
      // Instantiate OpenAIRepository
      OpenAIRepository openAI = OpenAIRepository();

      // For initiating a new chat
      final aiResponse = await openAI.getChat(userInput, cookieUser!);
      // For getting chat completions
      List<String> history = ["What is my name", "How are you today?"];
      final response =
          await openAI.getChatCompletions(history, userInput, cookieUser);

      // Create a new Message for the user's input and add it to messages

      messages.insert(0, Message(true, userInput));

      // Create a new Message for the AI response and add it to messages
      messages.insert(0, Message(false, aiResponse));

      // Clear the TextField
      controller.clear();

      // Update the UI
      setState(() {
        isTyping = true;
        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        isTyping = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.black,
        centerTitle: true,
        title: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/payment');
          }, // Add this onPressed callback
          // icon: const Icon(Icons),
          child: const Text('Upgrade'),
        ),
        actions: [
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: _handleLogout, // Add this onPressed callback
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: BubbleNormal(
                    text: messages[index].msg,
                    isSender: messages[index].isSender,
                    color: messages[index].isSender
                        ? Colors.blue.shade100
                        : Colors.grey.shade200,
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: controller,
                        textCapitalization: TextCapitalization.sentences,
                        onSubmitted: (value) {
                          // Call _incrementCounter when the user submits the text
                          _incrementCounter();
                        },
                        textInputAction: TextInputAction.send,
                        showCursor: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "Enter the title of the paper and auther to review",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Call _incrementCounter when the user taps the send button
                  _incrementCounter();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              )
            ],
          ),
        ],
      ),
    );
  }
}
