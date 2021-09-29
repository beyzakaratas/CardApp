import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return forgotPasswordField();
  }

  Widget forgotPasswordField() {
    return Column(
      children: [
        Text("Şifremi Unuttum Ekranı"),
      ],
    );
  }

}