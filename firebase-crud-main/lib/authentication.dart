import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googlesignin = GoogleSignIn();

// Future<bool?> googleSignin() async {
//   GoogleSignInAccount? googleSignInAccount = await googlesignin.signIn();
//   if (googleSignInAccount != null) {
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     AuthCredential authCredential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);
//     log(googleSignInAuthentication.accessToken.toString());
//     User? user = auth.currentUser;
//     log(user!.uid.toString());
//     await auth.signInWithCredential(authCredential);

//     return Future.value(true);
//   }
//   return null;
// } google login if required

Future<bool?> signup(String username, String password) async {
  try {
    UserCredential userresult = await auth.createUserWithEmailAndPassword(
        email: username, password: password);
    User? userlog = userresult.user;
    return Future.value(true);
  } catch (error) {
    log("something went wrong plz check $error");
  }
  return null;
}

Future<bool?> signin(String username, String password) async {
  try {
    UserCredential userresult = await auth.createUserWithEmailAndPassword(
        email: username, password: password);
    User? userlog = userresult.user;
    return Future.value(true);
  } catch (error) {
    log("something went wrong plz check $error");
  }
  return null;
}

Future<bool?> signoutuser() async {
  User user = auth.currentUser!;
  if (user.providerData[1].providerId == "google.com") {
    await googlesignin.disconnect();
  }

  await auth.signOut();
  return null;
}
