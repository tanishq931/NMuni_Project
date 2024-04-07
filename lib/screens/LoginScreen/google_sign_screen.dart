// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:nmuni_project/screens/HomeScreen/HomeScreen.dart';
//
//
//
// class AuthGoogle{
//   signInWithGoogle(BuildContext context) async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential)
//         .then((value) => Navigator.pushReplacement(context,
//         MaterialPageRoute(builder: (context)=>HomeScreen())));
//   }
//
// }
// // Future<UserCredential>