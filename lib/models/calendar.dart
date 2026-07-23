import 'package:flutter/material.dart';
import '../pages/homepage.dart';

class Calendar extends StatelessWidget{
  const Calendar({super.key});

 @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            const Icon(
              Icons.notifications,
              size: 100,
            ),


            const SizedBox(height: 20),


            const Text(
              "Welcome to Reminder",
              style: TextStyle(
                fontSize: 30,
              ),
            ),


            const SizedBox(height: 30),


            ElevatedButton(

              child: const Text(
                "Get Started",
              ),

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Calendar(),
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