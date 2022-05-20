import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOutExample extends StatefulWidget {
  const SignOutExample({Key? key}) : super(key: key);

  @override
  State<SignOutExample> createState() => _SignOutExampleState();
}

class _SignOutExampleState extends State<SignOutExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: signOut,
          child: Text('Out'),
        ),
      ),
    );
  }

  Future signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}
