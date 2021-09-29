import 'package:flutter/material.dart';

class NFCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biniş İşlemi"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(child: Image.asset('assets/images/nfc_tag.png'), padding: EdgeInsets.all(30.0),),
              Text('Lütfen telefonunuzu validatöre yaklaştırın.', style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
