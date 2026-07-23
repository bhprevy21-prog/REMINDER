import 'package:flutter/material.dart';
import 'pages/welcomepage.dart';

void main() {
  runApp(const ReminderApp());
}

class ReminderApp extends StatelessWidget {
  const ReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reminder",
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}