import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Reminder"),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.person,
              size: 100,
            ),

            const SizedBox(height: 20),

            Text(
              "Welcome $username!",
              style: const TextStyle(
                fontSize: 28,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "This is your Reminder homepage.",
            )

          ],
        ),
      ),
    );
  }
}