import 'package:flutter/material.dart';

import 'main_screen.dart';

class EDevletEntryScreen extends StatefulWidget {
  const EDevletEntryScreen({Key key}) : super(key: key);

  @override
  _EDevletEntryScreenState createState() => _EDevletEntryScreenState();
}

class _EDevletEntryScreenState extends State<EDevletEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("e-Devlet ile Giriş"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/images/e-Devlet_giris.jpg'),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  label: Text("İptal Et"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(width: 100,),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  icon: Icon(Icons.arrow_forward_ios,),
                  label: Text("Giriş Yap"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}

