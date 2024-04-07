// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:nmuni_project/screens/LoginScreen/LoginScreen.dart';
//
//
// class MySignUp extends StatelessWidget {
//
//   final email = TextEditingController();
//   final userName = TextEditingController();
//   final password = TextEditingController();
//   MySignUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body:
//       SafeArea(
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/background.jpg'),colorFilter: ColorFilter.srgbToLinearGamma(),
//                   fit: BoxFit.cover)
//           ),
//           child: Container(
//             height: double.infinity,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: 90,),
//                       Container(
//
//                         padding: EdgeInsets.only(left: 25,right: 25, top: 50, bottom: 30),
//                         child: Text(
//                           'Cine Samachaar ',
//                           style:  TextStyle(
//                               color: Colors.red,
//                               fontFamily: 'Netflix',
//                               fontSize: 45,
//                               fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,),
//                       ),
//                       SizedBox(height: 40,),
//                       TextField(
//                         controller: email,
//                         decoration: InputDecoration(
//                             fillColor: Colors.grey.shade100,
//                             filled: true,
//                             hintText: 'Email',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 10, color: Colors.red),
//                                 borderRadius: BorderRadius.circular(8)
//                             )
//                         ),
//                       ),
//                       SizedBox(height: 20,),
//                       TextField(
//                         controller: password,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             fillColor: Colors.grey.shade100,
//                             filled: true,
//                             hintText: 'Password',
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide(width: 3, color: Colors.redAccent),
//                                 borderRadius: BorderRadius.circular(8)
//                             )
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       ElevatedButton(
//                           onPressed: (){
//                             if(email.text.isNotEmpty && password.text.length > 6){
//                               FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) =>
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())))
//                                   .onError((error, stackTrace){
//                                 return "Error";
//                               });
//                             }
//                             else{
//                               Text('All the fields are mandatory');
//                             }
//                           },
//
//                           child: Text('SignUp')
//                       ),
//                       SizedBox(height: 20,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text('Already have an account?', style: TextStyle(color: Colors.white),),
//                           TextButton(
//                             onPressed: (){
//                               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                             },
//                             child: Text('LogIn'),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }