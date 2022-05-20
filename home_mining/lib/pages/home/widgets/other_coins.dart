import 'package:google_fonts/google_fonts.dart';
import 'package:home_mining/pages/home/widgets/coin_card.dart';
import 'package:home_mining/utils/static_data.dart';
import 'package:flutter/material.dart';

class OtherCoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 7.0),
                child: Text(
                  "Other Coins",
                  style: GoogleFonts.raleway(
                      fontSize: 18.0,
                      color: Colors.black
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                coin: StaticData.otherCoins[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15.0,
              );
            },
            itemCount: StaticData.otherCoins.length,
          )
        ],
      ),
    );
  }
}
