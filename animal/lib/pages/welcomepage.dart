import 'package:flutter/material.dart';
import 'userlogin.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("R.E.M.I.N.D.E.R"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.notifications_active,
              size: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "Welcome to Reminder!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UserLogin(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}