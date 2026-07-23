import 'package:flutter/material.dart';
import 'userlogin.dart';


class WelcomePage extends StatelessWidget {

  const WelcomePage({super.key});


  @override
  Widget build(BuildContext context) {

    const Color mint = Color(0xFF73FFEA);
    const Color green = Color(0xFF4ACF69);
    const Color background = Color(0xFFF5FFFD);


    return Scaffold(

      backgroundColor: background,


      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 30),


          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,


            children: [


              // Logo
              Container(

                height: 130,
                width: 130,

                decoration: BoxDecoration(

                  color: mint.withValues(alpha: 0.25),

                  shape: BoxShape.circle,

                ),


                child: const Icon(

                  Icons.notifications_active_rounded,

                  size: 70,

                  color: green,

                ),

              ),



              const SizedBox(height: 35),



              const Text(

                "Welcome to Reminder",

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 32,

                  fontWeight: FontWeight.bold,

                  color: Colors.black87,

                ),

              ),



              const SizedBox(height: 12),



              const Text(

                "Stay organized, remember what matters,\nand manage your day with ease.",

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 16,

                  color: Colors.black54,

                  height: 1.5,

                ),

              ),



              const SizedBox(height: 35),



              // Feature card

              Container(

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withValues(alpha: 0.05),

                      blurRadius: 15,

                      offset: const Offset(0,5),

                    )

                  ],

                ),


                child: const Column(

                  children: [


                    FeatureRow(

                      icon: Icons.check_circle_outline,

                      text: "Create and manage reminders",

                    ),



                    SizedBox(height: 15),



                    FeatureRow(

                      icon: Icons.notifications_none,

                      text: "Never miss important tasks",

                    ),



                    SizedBox(height: 15),



                    FeatureRow(

                      icon: Icons.cloud_done_outlined,

                      text: "Keep your reminders synced",

                    ),


                  ],

                ),

              ),



              const SizedBox(height: 40),




              SizedBox(

                width: double.infinity,


                height: 55,


                child: ElevatedButton(


                  style: ElevatedButton.styleFrom(

                    backgroundColor: green,

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(18),

                    ),

                  ),



                  child: const Text(

                    "Get Started",

                    style: TextStyle(

                      fontSize: 18,

                      fontWeight: FontWeight.bold,

                    ),

                  ),



                  onPressed: () {


                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) => const UserLogin(),

                      ),

                    );


                  },

                ),

              ),



              const SizedBox(height: 20),



              const Text(

                "Your information is safe and secure",

                style: TextStyle(

                  fontSize: 13,

                  color: Colors.black45,

                ),

              )

            ],

          ),

        ),

      ),

    );

  }

}



class FeatureRow extends StatelessWidget {


  final IconData icon;

  final String text;



  const FeatureRow({

    super.key,

    required this.icon,

    required this.text,

  });



  @override

  Widget build(BuildContext context) {


    return Row(


      children: [


        Icon(

          icon,

          color: Color(0xFF4ACF69),

        ),



        const SizedBox(width: 12),



        Text(

          text,

          style: const TextStyle(

            fontSize: 15,

            color: Colors.black87,

          ),

        )

      ],

    );

  }

}