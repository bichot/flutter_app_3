import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_3/User/repository/firebase_auth_api.dart';

class AuthRepository{

  final _firebaseAuthAPI = FireBaseAuthAPI();

  Future<User> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();
}