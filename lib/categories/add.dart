  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Addcategory extends StatefulWidget {
  const Addcategory({super.key});
  @override
  State<Addcategory> createState() => _AddcategoryState();
}

class _AddcategoryState extends State<Addcategory> {
  TextEditingController name = TextEditingController();
  CollectionReference categories =
      FirebaseFirestore.instance.collection('catego');
  GlobalKey<FormState> globalkey = GlobalKey();
  bool isloading = false;
  Future Addcate() async {
    if (globalkey.currentState!.validate()) {
      try { 
       
        isloading = true;
        setState(() {});
        ();
        DocumentReference response = await categories.add(
            {'name': name.text, 'id': FirebaseAuth.instance.currentUser!.uid});
        Navigator.of(context).pushNamedAndRemoveUntil(
          'homepage',
          (route) => false,
        );
      } catch (e) {
        isloading = false;
        print(e);
      }
    }
  }

  @override
  void dispose() {
    name.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category")),
      body: Form(
        key: globalkey,
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              ) :Container()
            // : Column(
            //     children: [
            //       Container(
            //         padding: const EdgeInsets.all(22),
            //         child: CustomTextFormaAdd(
            //             hinttext: "Enter Name",
            //             mycontroller: name,
            //             formstate: globalkey,
            //             validator: (val) {
            //               if (val == "") {
            //                 return "cannot be empty.";
            //               }
            //               return null;
            //             }),
            //       ),
            //       CustomButtonAuth(
            //           title: "Add",
            //           onPressed: () {
            //             Addcate();
            //           })
            //     ],
            //   ),
      ),
    );
  }
}
