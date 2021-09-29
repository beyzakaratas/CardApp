import 'package:card_app/screens/nfc_screen.dart';
import 'package:card_app/screens/qr_code_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        backgroundColor: Colors.deepPurple,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.all(20),
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            children: [
              GestureDetector(
                  child: Card(
                    elevation: 10,
                    child: Center(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/get_on_bus.png'),
                            Center(
                              child: Text(
                                "Biniş işlemi için tıklayınız.",
                                style: TextStyle(fontSize: 27),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NFCScreen()));
                  }),
              GestureDetector(
                  child: Card(
                    elevation: 10,
                    child: Center(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                child: Image.asset(
                                    'assets/images/get_off_bus.png')),
                            Center(
                              child: Text(
                                "İniş işlemi için tıklayınız.",
                                style: TextStyle(fontSize: 27),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodeScreen()));
                  }),
              /*Card(
                  elevation: 10,
                  child: GestureDetector(
                    child: Center(
                      child: Text(
                        "Biniş işlemi için tıklayınız.",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NFCScreen()));
                    },
                  )),
              Card(
                  elevation: 10,
                  child: GestureDetector(
                    child: Center(
                      child: Text(
                        "İniş işlemi için tıklayınız.",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrCodeScreen()));
                    },
                  )),*/
            ],
          )),
    );
  }
}
