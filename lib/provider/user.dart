


import 'package:flutter/material.dart';
import 'package:pepples_paper_review_ai/models/user.dart';

class Userdata extends ChangeNotifier {
  late User userdata;

  static final Userdata _instance = Userdata._internal();

  factory Userdata() {
    return _instance;
  }

  Userdata._internal();

  
  void updateUser(User newuser) {
    userdata = newuser;
    notifyListeners();
  }

  
  
}
