import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/constant.dart';
import 'package:firebaseproject/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DisplayuserData extends StatefulWidget {
  const DisplayuserData({super.key});

  @override
  State<DisplayuserData> createState() => _DisplayuserDataState();
}

String? name;
String? contactno;
String? address;
String? age;
String? bio;

class _DisplayuserDataState extends State<DisplayuserData> {
  var datacollected =
      FirebaseFirestore.instance.collection('UserData').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            User? user = FirebaseAuth.instance.currentUser;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(
                          uid: user!.uid,
                        )));
          },
        ),
        title: const Text(
          "Welcome",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        elevation: 0,
        flexibleSpace: Container(
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Image.asset(
            "assets/appbar.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: colorblue,
        child: Container(
          decoration: BoxDecoration(
              color: colorwhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: StreamBuilder<QuerySnapshot>(
              stream: datacollected,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorblue,
                    ),
                  ));
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Data Not Found"),
                  );
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: colorblue,
                              ),
                              onPressed: () {
                                // log(data['id']);
                                // ref.doc(data['id']).delete().whenComplete(() =>
                                //     Fluttertoast.showToast(msg: "Deleted "));
                                final docuser = FirebaseFirestore.instance
                                    .collection("UserData")
                                    .doc(data['id']);
                                docuser.delete();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const DisplayuserData()));
                                setState(() {});
                                // users
                                //     .doc(data['id'].toString())
                                //     .delete()
                                //     .then((value) => print("User Updated"))
                                //     .catchError((error) =>
                                //         print("Failed to update user: $error"));
                              }),
                          title: Text(data['name'].toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['contact no']),
                              Text(data['Address']),
                              Text(data["Age"]),
                              Text(data["Role"])
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
