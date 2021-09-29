import 'package:card_app/screens/my_wallet_screen.dart';
import 'package:card_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class CardOperationsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardOperationsState();
  }
}

class _CardOperationsState extends State {
  @override
  Widget build(BuildContext context) {
    return buildPayment();
  }

  Widget buildPayment() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kart İşlemleri"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: Text("E - Cüzdanım", style: TextStyle(fontSize: 18),),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWalletScreen()));
                    }),
              ),
            ),
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: Text("Bakiye Yükleme", style: TextStyle(fontSize: 18),),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentScreen()));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
