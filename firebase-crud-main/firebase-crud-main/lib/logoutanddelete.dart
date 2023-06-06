// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebaseproject/constant.dart';
import 'package:firebaseproject/googlesignin.dart';
import 'package:firebaseproject/herodialogueroute.dart';
import 'package:firebaseproject/homepage.dart';
import 'package:firebaseproject/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Logoutscreen extends StatefulWidget {
  const Logoutscreen({super.key});

  @override
  State<Logoutscreen> createState() => _LogoutscreenState();
}

class _LogoutscreenState extends State<Logoutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Log Out",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        flexibleSpace: Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Image.asset(
            "assets/appbar.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Center(
            child: ElevatedButton(
              style: loginbuttonstyle,
              onPressed: () {
                GoogleSignInProvider().logout().whenComplete(() =>
                    Fluttertoast.showToast(msg: "Loggin out...").then((value) =>
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()))));
              },
              child: const Text("Log Out"),
            ),
          )),
    );
  }
}

// class DeleteData extends StatefulWidget {
//   const DeleteData({super.key});

//   @override
//   State<DeleteData> createState() => _DeleteDataState();
// }

// class _DeleteDataState extends State<DeleteData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: const Text(
//           "Delete Data",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
//         ),
//         flexibleSpace: Container(
//           height: double.infinity,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Image.asset(
//             "assets/appbar.png",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       body: SizedBox(
//           height: double.maxFinite,
//           width: double.maxFinite,
//           child: Center(
//             child: ElevatedButton(
//               style: loginbuttonstyle,
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     HeroDialogRoute(
//                         builder: (context) => const LeaveWaarning(
//                               index: 0,
//                               data: "delete the data?",
//                             )));
//               },
//               child: const Text("Delete Data"),
//             ),
//           )),
//     );
//   }
// }

class LeaveWaarning extends StatefulWidget {
  final int? index;
  final String? data;
  const LeaveWaarning({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<LeaveWaarning> createState() => _LeaveWaarningState();
}

CollectionReference ref = FirebaseFirestore.instance.collection('UserData');

class _LeaveWaarningState extends State<LeaveWaarning> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 150,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Column(children: [
            Expanded(
              child: Text("Do you really want to ${widget.data}",
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      User? user = FirebaseAuth.instance.currentUser;
                      widget.index == 1
                          ? GoogleSignInProvider().logout().whenComplete(() =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage())))
                          : ref
                              .doc()
                              .delete()
                              .whenComplete(() => Fluttertoast.showToast(
                                  msg: "Data Deleted successfully"))
                              .then((value) {
                              User? user = FirebaseAuth.instance.currentUser;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage(
                                            uid: user!.uid,
                                          )));
                              setState(() {});
                            });
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                      ),
                    ))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
