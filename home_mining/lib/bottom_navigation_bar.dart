import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_mining/bottom_pages.dart';
import 'package:home_mining/out.dart';
import 'package:home_mining/pages/home/homepage.dart';
import 'package:home_mining/pages/home/widgets/wallet.dart';
import 'package:home_mining/utils/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'edHomeMining';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Raleway'
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
  
  void toggleBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              title: Text('Настройка оборудования'),
              leading: Icon(Icons.settings_rounded),
              onTap: () {},
            ),
            ListTile(
              title: Text('Техподдержка'),
              leading: Icon(Icons.manage_accounts),
              onTap: () {},
            ),
          ],
        ),
      );
    }
    );
  }
  
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    DetailWalletScreen(),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
    SignOutExample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeMining'),
        centerTitle: true,
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
            backgroundColor: Colors.deepPurple
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox),
            label: 'Майнинг',
            backgroundColor: Colors.lightBlue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Кошелек',
            backgroundColor: Colors.lightGreen
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Обменник',
            backgroundColor: Colors.amberAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Кабинет',
            backgroundColor: Colors.deepPurple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: toggleBottomSheet, label: Icon(Icons.keyboard_arrow_up)),
    );
  }
}
