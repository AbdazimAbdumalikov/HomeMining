import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_mining/pages/home/widgets/account_balance.dart';
import 'package:home_mining/pages/home/widgets/mining_card.dart';
import 'package:http/http.dart';

class MainScreenExample extends StatefulWidget {
  const MainScreenExample({Key? key}) : super(key: key);

  @override
  State<MainScreenExample> createState() => _MainScreenExampleState();
}

class _MainScreenExampleState extends State<MainScreenExample> {


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.deepPurpleAccent,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: AccountBalance(),
            )
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.deepPurpleAccent,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: MiningBalance(),
            )
        ),
      ],
      options: CarouselOptions(
        viewportFraction: 1,
        height: 170,
        autoPlay: true,
        aspectRatio: 4.0,
        enlargeCenterPage: true,
      ),
    );
  }
}
