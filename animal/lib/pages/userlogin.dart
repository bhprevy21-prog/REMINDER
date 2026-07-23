import 'package:flutter/material.dart';
import 'homepage.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String error = "";

  void login() {

    String username = usernameController.text;
    String password = passwordController.text;

    
    if (username == "admin" && password == "1234") {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(
            username: username,
          ),
        ),
      );

    } else {

      setState(() {
        error = "Incorrect username or password.";
      });

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text("Login"),
            ),

            const SizedBox(height: 20),

            Text(
              error,
              style: const TextStyle(
                color: Colors.red,
              ),
            )

          ],
        ),
      ),
    );
  }
}