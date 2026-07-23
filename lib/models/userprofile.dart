// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../services/auth_service.dart';

import '../pages/welcomepage.dart';



class UserProfile extends StatelessWidget {


  const UserProfile({super.key});



  @override
  Widget build(BuildContext context){


    User? user =
        FirebaseAuth.instance.currentUser;



    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Profile",
        ),

      ),



      body: Center(


        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,


          children: [



            CircleAvatar(

              radius: 50,

              backgroundImage:
                NetworkImage(
                  user!.photoURL!,
                ),

            ),



            const SizedBox(height:20),



            Text(

              user.displayName ?? 
              "No Name",

              style: const TextStyle(
                fontSize:25,
              ),

            ),



            Text(

              user.email ?? 
              "No Email",

            ),



            const SizedBox(height:30),



            ElevatedButton(

              child: const Text(
                "Logout",
              ),


              onPressed: () async{


                await AuthService().signOut();



                Navigator.pushReplacement(

                  context,

                  MaterialPageRoute(

                    builder: (_) =>
                      const WelcomePage(),

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