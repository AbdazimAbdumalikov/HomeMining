import 'package:google_fonts/google_fonts.dart';
import 'package:home_mining/bottom_pages.dart';
import 'package:home_mining/pages/home/widgets/account_balance.dart';
import 'package:home_mining/pages/home/widgets/notification_bell.dart';
import 'package:home_mining/pages/home/widgets/other_coins.dart';
import 'package:home_mining/pages/home/widgets/user_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              MainScreenExample(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  color: Color.fromRGBO(97, 99, 119, 1),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              UserBalance(),
              OtherCoins(),
              Padding(padding: EdgeInsets.only(bottom: 10.0))
            ],
          ),
        ),
      ),
    );
  }
}

