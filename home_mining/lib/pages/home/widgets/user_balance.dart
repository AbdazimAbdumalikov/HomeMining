import 'package:google_fonts/google_fonts.dart';
import 'package:home_mining/pages/home/widgets/coin_card.dart';
import 'package:home_mining/utils/static_data.dart';
import 'package:flutter/material.dart';

class UserBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Coins",
                style: GoogleFonts.raleway(
                  fontSize: 18.0,
                  color: Colors.black
                ),
              ),
              Text(
                "Total amount \$378.15",
                style: themeData.textTheme.caption,
              ),
            ],
          ),
          SizedBox(height: 15.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                coin: StaticData.userCoins[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15.0,
              );
            },
            itemCount: StaticData.userCoins.length,
          )
        ],
      ),
    );
  }
}
