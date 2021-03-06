import 'package:home_mining/models/coin.dart';
import 'package:home_mining/pages/coin_detail/widgets/coin_chart.dart';
import 'package:home_mining/pages/coin_detail/widgets/coin_stats.dart';
import 'package:home_mining/pages/coin_detail/widgets/single_coin_balance.dart';
import 'package:home_mining/pages/home/widgets/notification_bell.dart';
import 'package:home_mining/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CoinDetail extends StatelessWidget {
  final Coin coin;
  CoinDetail({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            FlutterIcons.keyboard_backspace_mdi,
          ),
        ),
        centerTitle: true,
        title: Text("${coin.toString()} (${coin.getCoinAbbr()})"),
        actions: [
          NotificationBell(),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 25.0,
              ),
              CoinStats(),
              SizedBox(
                height: 50.0,
              ),
              CoinChart(),
              SizedBox(
                height: 30.0,
              ),
              SingleCoinBalance(),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "BUY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "SELL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 25.0))
            ],
          ),
        ),
      ),
    );
  }
}
