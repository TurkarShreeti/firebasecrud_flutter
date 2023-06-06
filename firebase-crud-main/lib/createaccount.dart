import 'package:firebaseproject/constant.dart';
import 'package:firebaseproject/googlesignin.dart';
import 'package:firebaseproject/loginpage.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

bool istyping = false;
bool wanttodelete = false;
TextEditingController namecontroller = TextEditingController();
TextEditingController createuser = TextEditingController();
TextEditingController createpass = TextEditingController();
bool showpassword = true;

class _CreatePageState extends State<CreatePage> {
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
          body: Container(
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
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  elevation: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: colorwhite,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Create account",
                            style: TextStyle(
                                color: colorblue,
                                fontWeight: FontWeight.w500,
                                fontSize: 28),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextFormField(
                                controller: namecontroller,
                                onChanged: (newQuery) {
                                  setState(() {
                                    wanttodelete = true;
                                  });
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(17)),
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
                                    suffixIcon: wanttodelete
                                        ? IconButton(
                                            icon: Icon(Icons.close,
                                                color: colorblue),
                                            onPressed: () {
                                              usercontroller.clear();
                                              setState(() {
                                                wanttodelete = !wanttodelete;
                                              });
                                            },
                                          )
                                        : Icon(
                                            Icons.edit,
                                            color: colorblue,
                                          )),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: createuser,
                              onChanged: (newQuery) {
                                setState(() {
                                  istyping = true;
                                });
                              },
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(17)),
                                  ),
                                  // filled: true,
                                  // fillColor: Colors.white,
                                  labelText: "Email ID",
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
                                            createuser.clear();
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
                              controller: createpass,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(17)),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (namecontroller.text.isEmpty ||
                                      createuser.text.isEmpty ||
                                      createpass.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Fiels cannot be empty");
                                  }
                                  FireAuth()
                                      .registerUsingEmailPassword(
                                          name: namecontroller.text,
                                          email: createuser.text,
                                          password: createpass.text)
                                      .whenComplete(() => Fluttertoast.showToast(
                                          msg: "User created Successfully..."))
                                      .then((value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
                                          ));
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
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()),
                                  );
                                },
                                style: loginbuttonstyle,
                                child: Text(
                                  "Back to login page",
                                  style: buttontextstyle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      )),
    );
  }

  void nologintoast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
