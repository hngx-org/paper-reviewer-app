import 'package:flutter/material.dart';
import 'package:pepples_paper_review_ai/models/user.dart';

class Userdata extends ChangeNotifier {
  late User userdata;

  static final Userdata _instance = Userdata._internal();

  factory Userdata() {
    return _instance;
  }

  Userdata._internal();

  void init() {
    userdata = User(email: "exe@gmail.com", name: "", id: "yst");
    notifyListeners();
  }

  void updateUser(User newuser) {
    userdata = newuser;
    notifyListeners();
  }
}
