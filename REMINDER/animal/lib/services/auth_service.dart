import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<UserCredential?> signInWithGoogle() async {

    try {

      GoogleAuthProvider googleProvider =
          GoogleAuthProvider();


      return await _auth.signInWithPopup(
        googleProvider,
      );


    } catch(e) {


      return null;

    }

  }
  Future<UserCredential?> createAccount(
String email,
String password
) async {

  try {

    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        );


  } catch(e){


    return null;

  }

}


  Future<void> signOut() async {

    await _auth.signOut();

  }
  Future<UserCredential?> signInEmail(
String email,
String password
) async {


  try {

    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(

          email: email,

          password: password,

        );


  } catch(e){


    return null;

  }

}

}