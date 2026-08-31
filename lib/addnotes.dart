// import 'package:app/homepage.dart';
// import 'package:app/sqflite.dart';
// import 'package:flutter/material.dart';

// class Addnotes extends StatefulWidget {
//   const Addnotes({super.key});

//   @override
//   _AddnotesState createState() => _AddnotesState();
// }

// class _AddnotesState extends State<Addnotes> {
//   SqlDb sq = SqlDb();

//   GlobalKey<FormState> formstate = GlobalKey();
//   TextEditingController note = TextEditingController();
//   TextEditingController poster = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 55, 10, 57),
//         appBar: AppBar(
//           title: const Text(
//             "Add notes",
//             style: TextStyle(
//                 fontSize: 22, color: Color.fromARGB(255, 206, 160, 186)),
//           ),
//           backgroundColor: Colors.black,
//         ),
//         body: Container(
//           color: const Color.fromARGB(255, 62, 8, 65),
//           child: Center(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 6),
//               decoration: BoxDecoration(
//                   color: const Color.fromARGB(109, 3, 3, 3),
//                   borderRadius: BorderRadius.circular(14)),
//               height: 400,
//               width: 320,
//               child: Form(
//                 key: formstate,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     TextFormField(
//                       controller: note,
//                       decoration:
//                           const InputDecoration(labelText: "whats the note"),
//                     ),
//                     Container(
//                       height: 30,
//                     ),
//                     TextFormField(
//                       controller: poster,
//                       decoration: const InputDecoration(
//                         labelText: "who are the poster",
//                       ),
//                     ),
//                     Container(
//                       height: 60,
//                     ),
//                     MaterialButton(
//                       onPressed: () async {
//                         int response = await sq.insertData(
//                             " INSERT INTO 'notes' (`note` , `poster`) VALUES ('${note.text}','${poster.text}')");
//                         Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                               builder: (context) => const Homepage()),
//                           (route) => false,
//                         );
//                         print(response);
//                       },
//                       child: const Text("done"),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
