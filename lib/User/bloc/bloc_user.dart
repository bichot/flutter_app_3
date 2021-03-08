import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_app_3/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //flujo de datos -Streams
  //Stream -Firebase
  //StreamController
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  //1 SignIn a la aplicacion Google
  Future<User> signIn(){
    return _auth_repository.signInFirebase();
  }

  signOut(){
    _auth_repository.signOut();
  }


  @override
  void dispose() {

  }
}
