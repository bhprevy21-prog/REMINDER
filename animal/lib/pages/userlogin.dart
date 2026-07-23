import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'homepage.dart';


class UserLogin extends StatelessWidget {

  const UserLogin({super.key});


  void login(BuildContext context) async {


    final user =
        await AuthService().signInWithGoogle();



    if(user != null) {


      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder: (_) => const HomePage(),

        ),

      );


    }

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
      ),


      body: Center(

        child: ElevatedButton.icon(

          icon: const Icon(Icons.login),

          label: const Text(
            "Sign in with Google",
          ),


          onPressed: () {

            login(context);

          },

        ),

      ),

    );

  }

}