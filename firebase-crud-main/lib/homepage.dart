// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseproject/constant.dart';

import 'package:firebaseproject/displayuserdata.dart';
import 'package:firebaseproject/loginpage.dart';
import 'package:firebaseproject/logoutanddelete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  final String? uid;
  const MyHomePage({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController contactcontroller = TextEditingController();
TextEditingController addresscontroller = TextEditingController();
TextEditingController agecontroller = TextEditingController();
TextEditingController freetextcontroller = TextEditingController();
var datacollection = FirebaseFirestore.instance.collection('UserData');

class _MyHomePageState extends State<MyHomePage> {
  bool iswriting1 = false;
  bool iswriting2 = false;
  bool iswriting3 = false;
  bool iswriting4 = false;
  bool iswriting5 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Welcome",
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
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: colorblue,
                    image: const DecorationImage(
                        image:
                            AssetImage("assets/appbar.png"))), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: colorblue),
                  accountName: const Text(
                    "Welcome user",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: const Text("This app is an assignment app"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: colorwhite,
                    child: Text(
                      "R",
                      style: TextStyle(fontSize: 30.0, color: colorblue),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text(' See data '),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DisplayuserData()));
                },
              ),
              // ListTile(
              //   leading: const Icon(Icons.person),
              //   title: const Text(' Delete info '),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const DeleteData()));
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Logoutscreen()));
                },
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Text(
                  "Add Information",
                  style: TextStyle(
                      color: colorblue,
                      fontWeight: FontWeight.w500,
                      fontSize: 28),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormField(
                  controller: namecontroller,
                  onChanged: (newQuery) {
                    setState(() {
                      iswriting1 = true;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      // filled: true,
                      // fillColor: Colors.white,
                      labelText: "Name",
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: iswriting1
                          ? IconButton(
                              icon: Icon(Icons.close, color: colorblue),
                              onPressed: () {
                                namecontroller.clear();
                                setState(() {
                                  iswriting1 = !iswriting1;
                                });
                              },
                            )
                          : Icon(
                              Icons.edit,
                              color: colorblue,
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: contactcontroller,
                  onChanged: (newQuery) {
                    setState(() {
                      iswriting1 = true;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      // filled: true,
                      // fillColor: Colors.white,
                      labelText: "Contact no.",
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: iswriting2
                          ? IconButton(
                              icon: Icon(Icons.close, color: colorblue),
                              onPressed: () {
                                namecontroller.clear();
                                setState(() {
                                  iswriting2 = !iswriting2;
                                });
                              },
                            )
                          : Icon(
                              Icons.edit,
                              color: colorblue,
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: addresscontroller,
                  onChanged: (newQuery) {
                    setState(() {
                      iswriting1 = true;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      // filled: true,
                      // fillColor: Colors.white,
                      labelText: "Address",
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: iswriting3
                          ? IconButton(
                              icon: Icon(Icons.close, color: colorblue),
                              onPressed: () {
                                namecontroller.clear();
                                setState(() {
                                  iswriting3 = !iswriting3;
                                });
                              },
                            )
                          : Icon(
                              Icons.edit,
                              color: colorblue,
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: agecontroller,
                  onChanged: (newQuery) {
                    setState(() {
                      iswriting1 = true;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      // filled: true,
                      // fillColor: Colors.white,
                      labelText: "Enter Age",
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: iswriting4
                          ? IconButton(
                              icon: Icon(Icons.close, color: colorblue),
                              onPressed: () {
                                namecontroller.clear();
                                setState(() {
                                  iswriting4 = !iswriting4;
                                });
                              },
                            )
                          : Icon(
                              Icons.edit,
                              color: colorblue,
                            )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: freetextcontroller,
                  onChanged: (newQuery) {
                    setState(() {
                      iswriting1 = true;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                      ),
                      // filled: true,
                      // fillColor: Colors.white,
                      labelText: "Free Text",
                      floatingLabelStyle: TextStyle(
                        fontSize: 20,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: colorblue,
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: iswriting5
                          ? IconButton(
                              icon: Icon(Icons.close, color: colorblue),
                              onPressed: () {
                                namecontroller.clear();
                                setState(() {
                                  iswriting5 = !iswriting5;
                                });
                              },
                            )
                          : Icon(
                              Icons.edit,
                              color: colorblue,
                            )),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    log(widget.uid.toString());
                    // datacollection
                    //     .doc(widget.uid)
                    //     .collection('data')
                    //     .add({
                    //       "name": namecontroller.text,
                    //       "contact no": contactcontroller.text,
                    //       "Address": addresscontroller.text,
                    //       "Age": agecontroller.text,
                    //       "Role": freetextcontroller.text
                    //     })
                    //     .whenComplete(() => Fluttertoast.showToast(
                    //         msg: "Data added successfully."))
                    //     .then((value) => Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 const DisplayuserData())));
                    String id =
                        DateTime.now().microsecondsSinceEpoch.toString();

                    datacollection
                        .doc(id)
                        .set({
                          "name": namecontroller.text,
                          "contact no": contactcontroller.text,
                          "Address": addresscontroller.text,
                          "Age": agecontroller.text,
                          "Role": freetextcontroller.text,
                          "id": id
                        })
                        .whenComplete(() => Fluttertoast.showToast(
                            msg: "Data added successfully."))
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DisplayuserData())));
                  },
                  style: loginbuttonstyle,
                  child: Text(
                    "Add Information",
                    style: buttontextstyle,
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class ExitWarning extends StatelessWidget {
  const ExitWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 200,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Column(children: [
            const Expanded(
              child: Text("Do you really want to exit from the app",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
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
                      SystemNavigator.pop();
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
