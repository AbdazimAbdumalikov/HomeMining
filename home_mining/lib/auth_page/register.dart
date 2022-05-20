import 'package:flutter/material.dart';
import 'package:home_mining/auth_page/sign_up_page.dart';
import 'package:home_mining/auth_page/auth_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) =>
      isLogin
          ? AuthPageExample(onClickedSignUp: toggle)
          : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
