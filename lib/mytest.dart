// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// class MyTest extends StatefulWidget {
//   const MyTest({super.key});

//   @override
//   State<MyTest> createState() => _MyTestState();
// }

// class _MyTestState extends State<MyTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: OtpTextField(
//       filled: true,
//       fillColor: const Color.fromARGB(255, 191, 226, 255),
//       enabledBorderColor: Colors.amber,
//       fieldWidth: 54,
//       fieldHeight: 54,
//       numberOfFields: 5,
//       borderColor: const Color(0xFF512DA8),
//       //set to true to show as box or false to show as dash
//       showFieldAsBox: true,
//       //runs when a code is typed in
//       onCodeChanged: (String code) {
//         //handle validation or checks here
//       },
//       //runs when every textfield is filled
//       onSubmit: (String verificationCode) {
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: const Text("Verification Code"),
//                 content: Text('Code entered is $verificationCode'),
//               );
//             });
//       }, // end onSubmit
//     )));
//   }
// }
// import 'package:flutter/material.dart';

// class test extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: GridView.builder(
//                 scrollDirection: Axis.vertical,
//                 itemCount: 5,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisSpacing: 4, mainAxisSpacing: 4, crossAxisCount: 3),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     color: Colors.amber,
//                     width: 20,
//                     height: 20,
//                   );
//                 })));
//   }
// }

// import 'package:flutter/material.dart';
// class Lottie extends StatefulWidget {
//   const Lottie({super.key});

//   @override
//   State<Lottie> createState() => _LottieState();
// }

// class _LottieState extends State<Lottie> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container());
//   }
// }


