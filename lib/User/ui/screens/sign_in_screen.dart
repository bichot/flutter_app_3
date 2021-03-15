import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/widgets/gradient_back.dart';
import 'package:flutter_app_3/widgets/botton_green.dart';
import 'package:flutter_app_3/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_3/platzi_trips_cupertino.dart';
import 'package:flutter_app_3/User/model/user.dart' as Model;

class SignInScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //snapshot - data - object User
          if (!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI();
          } else {
            return PlatziTripsCupertino();
          }
        });
  }

  Widget signInGoogleUI() {
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBack(height: null),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome \n This is your Travel App",
                   style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
            ),
            ButtonGreen(
              text: "Login with Gmail",
              onPressed: () {
                userBloc.signOut();
                userBloc.signIn().then((User user) {
                  userBloc.updateUserData(Model.User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoURL));
                });
              },
              width: 300.0,
              height: 50.0,
            )
          ],
        )
      ],
    ));
  }
}
