import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State {
  final amountController = TextEditingController();
  final nameController = TextEditingController();
  final cardIdController = TextEditingController();
  final dateController = TextEditingController();
  final cvvController = TextEditingController();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return buildPayment();
  }

  Widget buildPayment() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bakiye Yükleme"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildSizedBoxField(50.0),
              buildAmountField(),
              buildSizedBoxField(20.0),
              buildTextField(),
              buildSizedBoxField(12.0),
              buildCardIdField(),
              buildSizedBoxField(12.0),
              buildNameField(),
              buildSizedBoxField(8.0),
              buildDateField(),
              buildSizedBoxField(8.0),
              buildCVVField(),
              buildSizedBoxField(150.0),
              confirmTermsOfServiceField(),
              buildPaymentButton()
            ],
          ),
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      controller: nameController,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          icon: Icon(Icons.account_circle),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelText: "Kart Üzerindeki İsim"),
    );
  }

  buildCardIdField() {
    return TextField(
      controller: cardIdController,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          icon: Icon(Icons.credit_card_rounded),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelText: "Kart Numarası"),
    );
  }

  buildDateField() {
    return TextFormField(
      controller: dateController,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      decoration: InputDecoration(
          icon: Icon(Icons.date_range_rounded),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelText: "Son Kullanma Tarihi",
          contentPadding: EdgeInsets.all(20.0)),
    );
  }

  buildCVVField() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: TextField(
        controller: cvvController,
        enabled: !isLoggedIn,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        decoration: InputDecoration(
            icon: Icon(Icons.calendar_view_day_rounded),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelText: "CVV"),
      ),
    );
  }

  buildAmountField() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: TextField(
        controller: cvvController,
        enabled: !isLoggedIn,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        decoration: InputDecoration(
            border:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            labelText: "Yüklemek istediğiniz TL tutarı"),
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

  buildPaymentButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurpleAccent,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text("Ödeme Yap"),
      onPressed: () {
        print("Tıklandı");
      },
    );
  }

  buildTextField() {
    return Center(
      child: Text(
        "Kart Bilgileri",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  buildSizedBoxField(height) {
    return SizedBox(
      height: height,
    );
  }
}
