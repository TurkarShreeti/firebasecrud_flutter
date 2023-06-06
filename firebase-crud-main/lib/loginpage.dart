import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/authentication.dart';
import 'package:firebaseproject/constant.dart';
import 'package:firebaseproject/createaccount.dart';
import 'package:firebaseproject/googlesignin.dart';
import 'package:firebaseproject/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool istyping = false;
TextEditingController usercontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();
bool showpassword = true;

class _LoginPageState extends State<LoginPage> {
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
          body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return Container(
                color: colorwhite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        top: 60,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ))
                          ],
                        )),
                    Positioned(
                        top: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/appbar.png"),
                                  fit: BoxFit.cover),
                              color: colorblue,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60))),
                        )),
                    Positioned(
                        top: 50,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/welcome.png",
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.24,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/bluerect.png"),
                                  fit: BoxFit.cover),
                              color: colorblue,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.22,
                        left: MediaQuery.of(context).size.height * 0.05,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          elevation: 10,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                color: colorwhite,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        color: colorblue,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 28),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: usercontroller,
                                      onChanged: (newQuery) {
                                        setState(() {
                                          istyping = true;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 15),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(17)),
                                          ),
                                          // filled: true,
                                          // fillColor: Colors.white,
                                          labelText: "UserName",
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
                                          suffixIcon: istyping
                                              ? IconButton(
                                                  icon: Icon(Icons.close,
                                                      color: colorblue),
                                                  onPressed: () {
                                                    usercontroller.clear();
                                                    setState(() {
                                                      istyping = !istyping;
                                                    });
                                                  },
                                                )
                                              : Icon(
                                                  Icons.edit,
                                                  color: colorblue,
                                                )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: _passwordcontroller,
                                      onChanged: (newQuery) {
                                        setState(() {
                                          istyping = true;
                                        });
                                      },
                                      obscureText: showpassword,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 15),
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(17)),
                                          ),
                                          // filled: true,
                                          // fillColor: Colors.white,
                                          labelText: "Password",
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
                                          suffixIcon: IconButton(
                                            icon: Icon(Icons.remove_red_eye,
                                                color: colorblue),
                                            onPressed: () {
                                              setState(() {
                                                showpassword = !showpassword;
                                              });
                                            },
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          // if (usercontroller.text.isEmpty) {
                                          //   Fluttertoast.showToast(
                                          //     msg: "Please enter the Username",
                                          //   );
                                          // } else {
                                          //   Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             const MyHomePage()),
                                          //   ).then((value) => nologintoast(
                                          //       "Welcome ${usercontroller.text}"));
                                          // }
                                          if (usercontroller.text.isEmpty &&
                                              _passwordcontroller
                                                  .text.isEmpty) {
                                            return nologintoast(
                                                "Fields cannot be empty",
                                                context);
                                          }
                                          // signin(usercontroller.text,
                                          //         _passwordcontroller.text)
                                          //     .whenComplete(() {
                                          //   User? user = FirebaseAuth
                                          //       .instance.currentUser;
                                          //   log(user!.uid.toString());
                                          //   Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             MyHomePage(
                                          //               uid:
                                          //                   user.uid.toString(),
                                          //             )),
                                          //   );
                                          // });
                                          User? user = await FireAuth
                                                  .loginusingemailpassword(
                                                      usercontroller.text,
                                                      _passwordcontroller.text)
                                              .whenComplete(() => nologintoast(
                                                  "Login successfull", context))
                                              .then((value) {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHomePage(
                                                          uid: FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid)),
                                            );
                                          });
                                        },
                                        style: loginbuttonstyle,
                                        child: Text(
                                          "   Login   ",
                                          style: buttontextstyle,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CreatePage()),
                                          );
                                        },
                                        style: loginbuttonstyle,
                                        child: Text(
                                          "Create Account",
                                          style: buttontextstyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const Text("Login using"),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          final provider =
                                              Provider.of<GoogleSignInProvider>(
                                                  context,
                                                  listen: false);
                                          User? user =
                                              FirebaseAuth.instance.currentUser;
                                          provider.login().whenComplete(
                                              () => Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyHomePage(
                                                              uid: user?.uid
                                                                  .toString(),
                                                            )),
                                                  ));
                                        },
                                        //     await googleSignin().whenComplete(() {
                                        //   User? user =
                                        //       FirebaseAuth.instance.currentUser;
                                        //   Navigator.pushReplacement(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) => MyHomePage(
                                        //               uid: user?.uid.toString(),
                                        //             )),
                                        //   ).then((value) =>
                                        //       nologintoast("Login Successfully"));
                                        // }

                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child:
                                              Image.asset("assets/google.png"),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              );
            }),
      )),
    );
  }

  void nologintoast(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }
}
