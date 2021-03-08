import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthAPI{

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<auth.User> signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA =await googleSignInAccount.authentication;

    auth.UserCredential userCredential = await _auth.signInWithCredential(
      auth.GoogleAuthProvider.credential(
          idToken: gSA.idToken,
          accessToken: gSA.accessToken));

    return userCredential.user;

  }

  void signOut() async{
    await _auth.signOut().then((Value) => print("Sesion cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");

  }
}

