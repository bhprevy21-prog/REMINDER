import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'homepage.dart';


class SignupPage extends StatefulWidget {

  const SignupPage({super.key});


  @override
  State<SignupPage> createState() => _SignupPageState();

}



class _SignupPageState extends State<SignupPage> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void signup() async {


    final user = await AuthService()
        .createAccount(
          emailController.text.trim(),
          passwordController.text.trim(),
        );


    if(user != null){

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
        title: const Text("Create Account"),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [


            TextField(

              controller: emailController,

              decoration:
              const InputDecoration(
                labelText: "Email",
              ),

            ),



            TextField(

              controller: passwordController,

              obscureText: true,

              decoration:
              const InputDecoration(
                labelText: "Password",
              ),

            ),



            const SizedBox(height:20),



            ElevatedButton(

              onPressed: signup,

              child:
              const Text("Create Account"),

            )


          ],

        ),

      ),

    );

  }

}