import 'package:card_app/models/card_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CardDetailScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CardDetailState();
  }
}

class  _CardDetailState extends State{

  List <CardDetail> details = [
    CardDetail("Fırat Caddesi - Bosna Hersek", 1.55, 0.85),
    CardDetail("Zafer - Eğitim Fakültesi", 1.55, 0.15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildDetails(),
    );
  }
  
  buildDetails() {
    return Column(
      children: [
        Container(
          child: Image.asset('assets/images/elkart.jpg'),
          padding: EdgeInsets.all(30.0),
        ),
        Text(
          "Kalan Bakiye: 12.35",
          style: TextStyle(fontSize: 15),
        ),
        Divider(),
        Text("Son Yapılan İşlemler", textAlign: TextAlign.center,),
        Divider(),
        // durak classı nesnelerinin bilgileri, durak adı para alımı-iadesi
        Expanded(
            child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(details[index].stopName + "      -" + details[index].spentMoney.toString()),
                  subtitle: Text("İade edilen miktar:  +" + details[index].backMoney.toString(), style: TextStyle(color: Colors.green),),
                );
              },
            ),
        )
      ],
    );
  }
  
}