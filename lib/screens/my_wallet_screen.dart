import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cüzdanım"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Card(
                margin: EdgeInsets.all(10),
                elevation: 20,
                child: SizedBox(
                  width: 300,
                  height: 150,
                  child: Center(
                    child: Text('Cüzdan Resmi'),
                  ),
                )),
            Card(
              child: ListTile(
                title: Text("Mevcut Bakiye: "),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.black,
                height: 30,
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Son Yapılan İşlemler "),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
