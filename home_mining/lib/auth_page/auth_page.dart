import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_mining/auth_page/register.dart';

class AuthPageExample extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const AuthPageExample({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<AuthPageExample> createState() => _AuthPageExampleState();
}

class _AuthPageExampleState extends State<AuthPageExample> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Home Mining', style: GoogleFonts.raleway(color: Colors.lightGreen, fontSize: 26)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('Добро пожаловать!', style: TextStyle(fontSize: 20),),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 40)),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Логин',
                    hintText: 'Введите email или логин'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: 'Пароль',
                      hintText: 'Введите пароль',
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue
                  ),
                  child: Text('Войти'),
                    onPressed: signIn
                ),
                SizedBox(height: 26),
                RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black, fontSize: 20,
                      ),
                      text: 'No account?',
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = widget.onClickedSignUp,
                          text: 'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )
                        )
                      ]
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
    );
  }
}
