import 'package:card_app/screens/card_operations_screen.dart';
import 'package:card_app/screens/cards_screen.dart';
import 'package:card_app/screens/home_screen.dart';
import 'package:card_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = [
    HomeScreen(),
    Kart(),
    CardOperationsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        fixedColor: Colors.deepPurple,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Ana Sayfa"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card,),
              label: "Kartlarım"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.multiple_stop),
              label: "İşlemler"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Hesabım",
          ),
        ],
      ),
    );
  }
}