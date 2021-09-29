import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CitiesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CitiesScreenState();
  }
}

class _CitiesScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return buildCities();
  }

  Widget buildCities() {
    return Text("Şehirler Ekranı");
  }
}