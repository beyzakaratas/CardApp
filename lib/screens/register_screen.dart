import 'package:card_app/screens/e_devlet_entry_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  // ad,soyad, email, şifre alınacak daha sonra e devletten giriş sağlandıktan sonra hes kodu, tipi doğrulanması sağlanacak
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends State{
  @override
  Widget build(BuildContext context) {
    return buildRegisterField();
  }

  final controllerName = TextEditingController();
  final controllerSurname = TextEditingController();
  final controllerEMail = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerPassword = TextEditingController();
  bool isLoggedIn = false;


  Widget buildRegisterField() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kaydol"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              nameField(),
              SizedBox(
                height: 8.0,
              ),
              surnameField(),
              SizedBox(
                height: 8.0,
              ),
              eMailField(),
              SizedBox(
                height: 8.0,
              ),
              phoneNumberField(),
              SizedBox(
                height: 8.0,
              ),
              passwordField(),
              SizedBox(
                height: 8.0,
              ),
              confirmTermsOfServiceField(),
              buildNextButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextField(
      controller: controllerName,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelText: "Adınız"
      ),
    );
  }

  Widget surnameField() {
    return TextField(
      controller: controllerSurname,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelText: "Soyadınız"
      ),
    );
  }

  Widget eMailField() {
    return TextField(
      controller: controllerEMail,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelText: "e Mail Adresiniz"
      ),
    );
  }

  Widget phoneNumberField() {
    return TextField(
      controller: controllerPhoneNumber,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelText: "Telefon Numaranız"
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      controller: controllerPassword,
      enabled: !isLoggedIn,
      obscureText: true,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelText: "Şifreniz"
      ),
    );
  }
  var _checked = false;
  Widget confirmTermsOfServiceField() {
    return CheckboxListTile(
      title: Text("Hizmet Kullanım Koşullarını Okudum, Kabul Ediyorum."),
      controlAffinity: ListTileControlAffinity.platform,
      value: _checked,
      onChanged: (bool value) {
        setState(() {
          _checked = value;
        });
      },
      activeColor: Colors.deepPurple,
      checkColor: Colors.white,
    );
  }

  Widget buildNextButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      child: Text("İleri >"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EDevletEntryScreen()));
      },
    );
  }

}