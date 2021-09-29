import 'package:card_app/screens/forgot_password_screen.dart';
import 'package:card_app/screens/main_screen.dart';
import 'package:card_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EntryScreenState();
  }
}

class _EntryScreenState extends State {
  final controllerEMail = TextEditingController();
  final controllerPassword = TextEditingController();
  String message = "CardApp";

  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(message),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildImageField(),
              SizedBox(
                height: 16,
              ),
              buildEMailNumberField(),
              SizedBox(
                height: 8,
              ),
              buildPasswordField(),
              SizedBox(
                height: 8,
              ),
              buildEntryButton(),
              Row(
                children: [
                  buildForgotPasswordField(),
                  SizedBox(
                    width: 10.0,
                  ),
                  buildRegisterField(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildImageField() {
    return Container(
     height: 300,
      child: Image.asset('assets/images/giris.png'),
    );
  }

  Widget buildEMailNumberField() {
    return TextField(
      controller: controllerEMail,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)),
          labelText: "e Mail"
      ),
    );
  }

  buildPasswordField() {
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
          labelText: "Şifre"
      ),
    );
  }

  buildForgotPasswordField() {
    return TextButton(
        child: Text(
          "Şifremi Unuttum",
          style: TextStyle(
            decoration: TextDecoration.underline
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
        },
      );
  }

  buildEntryButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurpleAccent,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      child: Text("Giriş Yap"),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
      },
    );
  }

  buildRegisterField() {
    return Padding(
      padding: const EdgeInsets.only(left: 100.0),
      child: TextButton(
        child: Text("KAYDOL"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
      ),
    );
  }
}