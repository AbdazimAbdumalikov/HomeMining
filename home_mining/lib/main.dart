// @dart=2.9

import 'package:flutter/material.dart';
import 'package:home_mining/auth_page/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:home_mining/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_mining/pages/home/homepage.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) => new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(
        home: StreamBuilder<User>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MyStatefulWidget();
              }
              else {
                return AuthPageExample(onClickedSignUp: () { },);
              }
            }
        ),
      ),
  );
}