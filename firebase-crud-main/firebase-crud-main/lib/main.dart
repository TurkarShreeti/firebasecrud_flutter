import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/homepage.dart';
import 'package:firebaseproject/loginpage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IsLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IsLogin extends StatefulWidget {
  const IsLogin({super.key});

  @override
  State<IsLogin> createState() => _IsLoginState();
}

class _IsLoginState extends State<IsLogin> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.value(FirebaseAuth.instance.currentUser),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User? user = snapshot.data;
            return MyHomePage(uid: user!.uid);
          } else {
            return const LoginPage();
          }
        });
  }
}
