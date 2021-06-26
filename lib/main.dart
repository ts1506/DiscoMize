import 'package:discomize/screens/DiscomizeHome.dart';
import 'package:discomize/screens/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  // To-Do: Persistent Token-Handling
  bool tokenExists = false;
  if (tokenExists) {
    runApp(DiscomizeHome());
  } else {
    runApp(LoginPage());
  }
}
