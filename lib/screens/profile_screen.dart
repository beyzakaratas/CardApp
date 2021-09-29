import 'package:card_app/screens/entry_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> titles = [
    "Yolcu Tipi: ",
    "Sağlık Durumu: ",
    "Telefon Numarası: ",
    "Bilgilerimi Güncelle",
    "Çıkış Yap"
  ];

  List<IconData> icons = [
    Icons.attribution_outlined,
    Icons.coronavirus_outlined,
    Icons.phone,
    Icons.update_outlined,
    Icons.login_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: buildBody(),
      ),
    );
  }

  buildBody() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildSizedBoxField(),
          buildProfilePhotoField(),
          buildNameField(),
          buildDividerField(),
          buildSizedBoxField(),
          buildListViewField(),
        ],
      ),
    );
  }

  buildListViewField() {
    return ListView.builder(
      itemCount: titles.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
            onTap: () {
              if (index == 3) {
                print("Tıklandı");
              } else if (index == 4) {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text("Çıkış Yap"),
                          content: const Text(
                              "Hesabınızdan çıkış yapmak istediğinize emin misiniz?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Evet');
                                  Navigator.pop(context);
                                },
                                child: Text("Evet")),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Hayır');
                                },
                                child: Text("Hayır"))
                          ],
                        ));
              }
            },
          ),
        );
      },
    );
  }

  buildDividerField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        color: Colors.black,
        height: 30,
      ),
    );
  }

  buildProfilePhotoField() {
    return CircleAvatar(
      radius: 70,
      backgroundColor: Colors.grey,
      child: ClipRRect(
        child: Image.asset('assets/images/user.png'),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }

  buildNameField() {
    return Center(
      child: Text(
        "Adı Soyadı",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  buildSizedBoxField() {
    return SizedBox(
      height: 25,
    );
  }
}