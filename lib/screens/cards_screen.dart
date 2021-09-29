import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'route',
    home: Kart(),
  ));
}

final List<String> sehirler = [
  "İstanbul",
  "Ankara",
  "İzmir",
  "Konya",
  "Adana",
  "Adıyaman",
  "Afyonkarahisar",
  "Ağrı",
  "Aksaray",
  "Amasya",
  "Antalya",
  "Ardahan",
  "Artvin",
  "Aydın",
  "Balıkesir",
  "Bartın",
  "Batman",
  "Bayburt",
  "Bilecik",
  "Bingöl",
  "Bitlis",
  "Bolu",
  "Burdur",
  "Bursa",
  "Çanakkale",
  "Çankırı",
  "Çorum",
  "Denizli",
  "Diyarbakır",
  "Düzce",
  "Edirne",
  "Elazığ",
  "Erzincan",
  "Erzurum",
  "Eskişehir",
  "Gaziantep",
  "Giresun",
  "Gümüşhane",
  "Hakkâri",
  "Hatay",
  "Iğdır",
  "Isparta",
  "Kahramanmaraş",
  "Karabük",
  "Karaman",
  "Kars",
  "Kastamonu",
  "Kayseri",
  "Kilis",
  "Kırıkkale",
  "Kırklareli",
  "Kırşehir",
  "Kocaeli",
  "Kütahya",
  "Malatya",
  "Manisa",
  "Mardin",
  "Mersin",
  "Muğla",
  "Muş",
  "Nevşehir",
  "Niğde",
  "Ordu",
  "Osmaniye",
  "Rize",
  "Sakarya",
  "Samsun",
  "Şanlıurfa",
  "Siirt",
  "Sinop",
  "Sivas",
  "Şırnak",
  "Tekirdağ",
  "Tokat",
  "Trabzon",
  "Tunceli",
  "Uşak",
  "Van",
  "Yalova",
  "Yozgat",
  "Zonguldak"
];
List<String> dijitalKartlarim = [];

class Kart extends StatefulWidget {
  @override
  _KartState createState() => _KartState();
}

class _KartState extends State<Kart> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Dijital Kartlarım'),
        ),
        body: Column(
          children: [
            Expanded(
                child: SafeArea(
              child: Container(
                child: ListView.builder(
                    itemCount: dijitalKartlarim.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(dijitalKartlarim[index]),
                        subtitle:
                            Text('${dijitalKartlarim[index]} dijital kartım'),
                        trailing: Icon(Icons.arrow_forward),
                        leading:
                            Image.asset("assets/images/dijital_kartım.png"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      KartHareketleri(index)));
                        },
                      );
                    }),
              ),
            )),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SehirListeleme()));
                  },
                  child: Text(
                    'Dijital Kart Oluştur',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SehirListeleme extends StatefulWidget {
  @override
  _SehirListelemeState createState() => _SehirListelemeState();
}

class _SehirListelemeState extends State<SehirListeleme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Şehir Seçiniz'),
        ),
        body: ListView.builder(
          itemCount: sehirler.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  title: Text(
                    sehirler[index],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('${sehirler[index]} şehrini seçtiniz'),
                        content: Text(
                            '${sehirler[index]} kartını oluşturmak istiyor musunuz ? '),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Hayır'),
                            child: const Text('Hayır'),
                          ),
                          TextButton(
                            onPressed: () {
                              dijitalKartlarim.add(sehirler[index]);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Kart()));
                            },
                            child: Text('Evet'),
                          ),
                        ],
                      ),
                    );
                  }),
            );
          },
        ),
      ),
    );
  }
}

class KartHareketleri extends StatelessWidget {
  final int index;
  KartHareketleri(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("${dijitalKartlarim[index]} Kart Hareketleri"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
              child: Container(
            padding: EdgeInsets.only(top: 3, bottom: 8),
            margin: EdgeInsets.all(8),
            child: Text(
              "Kart Okutma:",
              style: TextStyle(fontSize: 20),
            ),
            color: Colors.black12,
          )),
          SafeArea(
              child: Container(
            padding: EdgeInsets.only(top: 3, bottom: 8),
            margin: EdgeInsets.all(8),
            child: Text(
              "Ücret İadesi:",
              style: TextStyle(fontSize: 20),
            ),
            color: Colors.black12,
          ))
        ],
      ),
    );
  }
}
