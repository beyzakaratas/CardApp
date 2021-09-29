import 'package:card_app/screens/entry_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CardApp()));
}

class CardApp extends StatefulWidget {
  @override
  _CardAppState createState() => _CardAppState();
}

class _CardAppState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EntryScreen(),
    );
  }
}