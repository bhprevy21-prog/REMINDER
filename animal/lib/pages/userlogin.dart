import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'homepage.dart';
import 'signup.dart';


class UserLogin extends StatefulWidget {

  const UserLogin({super.key});


  @override
  State<UserLogin> createState() => _UserLoginState();

}



class _UserLoginState extends State<UserLogin> {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  bool loading = false;



  Future<void> googleLogin() async {

    setState(() {
      loading = true;
    });


    final user =
        await AuthService().signInWithGoogle();


    if(user != null){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );

    }


    setState(() {
      loading = false;
    });

  }





  Future<void> emailLogin() async {


    setState(() {
      loading = true;
    });



    final user =
        await AuthService().signInEmail(
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



    setState(() {

      loading = false;

    });


  }




  @override
  Widget build(BuildContext context) {


    const Color mint = Color(0xFF73FFEA);
    const Color green = Color(0xFF4ACF69);
    const Color background = Color(0xFFF5FFFD);



    return Scaffold(

      backgroundColor: background,


      appBar: AppBar(

        backgroundColor: Colors.transparent,

        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),

      ),



      body: Padding(

        padding:
        const EdgeInsets.symmetric(horizontal: 30),


        child: Center(


          child: SingleChildScrollView(


            child: Column(


              children: [



                Container(

                  height: 110,

                  width: 110,


                  decoration: BoxDecoration(

                    color:
                    mint.withValues(alpha:0.25),

                    shape: BoxShape.circle,

                  ),


                  child: const Icon(

                    Icons.person_outline_rounded,

                    size: 60,

                    color: green,

                  ),

                ),



                const SizedBox(height:30),




                const Text(

                  "Welcome Back",

                  style: TextStyle(

                    fontSize:32,

                    fontWeight:
                    FontWeight.bold,

                  ),

                ),




                const SizedBox(height:10),




                const Text(

                  "Sign in to access your reminders\nand stay organized.",

                  textAlign:
                  TextAlign.center,

                  style: TextStyle(

                    color: Colors.black54,

                    fontSize:16,

                  ),

                ),




                const SizedBox(height:35),




                Container(

                  padding:
                  const EdgeInsets.all(25),


                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(25),


                    boxShadow:[

                      BoxShadow(

                        color:
                        Colors.black.withValues(alpha:0.05),

                        blurRadius:20,

                        offset:
                        const Offset(0,8),

                      )

                    ],

                  ),




                  child: Column(


                    children:[



                      TextField(

                        controller:
                        emailController,

                        decoration:
                        const InputDecoration(

                          labelText:"Email",

                          prefixIcon:
                          Icon(Icons.email_outlined),

                        ),

                      ),



                      const SizedBox(height:15),




                      TextField(

                        controller:
                        passwordController,

                        obscureText:true,

                        decoration:
                        const InputDecoration(

                          labelText:"Password",

                          prefixIcon:
                          Icon(Icons.lock_outline),

                        ),

                      ),




                      const SizedBox(height:25),




                      SizedBox(

                        width:double.infinity,

                        height:55,


                        child:
                        ElevatedButton(

                          onPressed:
                          loading
                              ? null
                              : emailLogin,


                          style:
                          ElevatedButton.styleFrom(

                            backgroundColor:
                            green,

                            foregroundColor:
                            Colors.white,

                            shape:
                            RoundedRectangleBorder(

                              borderRadius:
                              BorderRadius.circular(18),

                            ),

                          ),



                          child:

                          loading

                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )

                              :

                          const Text(

                            "Sign In",

                            style:
                            TextStyle(

                              fontSize:16,

                              fontWeight:
                              FontWeight.bold,

                            ),

                          ),

                        ),

                      ),




                      const SizedBox(height:20),




                      const Row(

                        children:[

                          Expanded(
                            child: Divider(),
                          ),

                          Padding(

                            padding:
                            EdgeInsets.symmetric(horizontal:10),

                            child:
                            Text("OR"),

                          ),

                          Expanded(
                            child: Divider(),
                          ),

                        ],

                      ),




                      const SizedBox(height:20),




                      SizedBox(

                        width:double.infinity,

                        height:55,


                        child:
                        ElevatedButton.icon(

                          icon:
                          const Icon(Icons.login),


                          label:
                          const Text(
                            "Continue with Google",
                          ),


                          style:
                          ElevatedButton.styleFrom(

                            backgroundColor:
                            Colors.white,

                            foregroundColor:
                            Colors.black87,


                            shape:
                            RoundedRectangleBorder(

                              borderRadius:
                              BorderRadius.circular(18),

                            ),

                          ),


                          onPressed:
                          loading
                              ? null
                              : googleLogin,

                        ),

                      ),



                    ],

                  ),

                ),




                const SizedBox(height:25),




                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.center,


                  children:[


                    const Text(
                      "Don't have an account?",
                    ),


                    TextButton(

                      onPressed:(){

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder:
                            (_) =>
                            const SignupPage(),

                          ),

                        );

                      },


                      child:
                      const Text(

                        "Create Account",

                        style:
                        TextStyle(

                          color:
                          green,

                        ),

                      ),

                    )

                  ],

                ),




                const Text(

                  "Your account is protected and secure",

                  style:
                  TextStyle(

                    fontSize:13,

                    color:
                    Colors.black45,

                  ),

                )



              ],

            ),

          ),

        ),

      ),

    );

  }

}