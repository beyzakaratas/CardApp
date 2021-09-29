import 'package:card_app/models/digital_cards.dart';
import 'package:card_app/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({Key key}) : super(key: key);

  @override
  _PaymentDetailScreenState createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  String _chosenValue;
  final controllerMoneyAmount = TextEditingController();
  bool isLoggedIn = false;
  int selectedValue;

  List<DigitalCards> _dropdownItems = [
    DigitalCards(0, "e - Cüzdanım"),
    DigitalCards(1, "El Kart"),
    DigitalCards(2, "Ankara Kart"),
    DigitalCards(3, "İstanbul Kart")
  ];

  List<DropdownMenuItem<DigitalCards>> _dropdownMenuItems;
  DigitalCards _digitalCards;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _digitalCards = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bakiye Yükleme"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSizedBoxField(16.0),
            buildChoiceText(),
            buildDropdownButtonField(),
            buildTextFormField(),
            buildSizedBoxField(24.0),
            buildPaymentChoiceText(),
            buildSizedBoxField(16.0),
            buildRadioButtonField(),
            buildPayNowButtonField()
          ],
        ),
      ),
    );
  }

  buildDropdownButtonField() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: DropdownButton<DigitalCards>(
          value: _digitalCards,
          items: _dropdownMenuItems,
          onChanged: (value) {
            setState(() {
              _digitalCards = value;
            });
          }),
    );
  }

  buildTextFormField() {
    return TextField(
      controller: controllerMoneyAmount,
      enabled: !isLoggedIn,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      decoration: InputDecoration(
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          labelText: "Yüklenecek TL tutarı"),
    );
  }

  buildRadioButtonField() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          RadioListTile(
            value: 0,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            title: Text("E - Cüzdanım"),
          ),
          RadioListTile(
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            title: Text("Kredi / Banka Kartı ile"),
          ),
          buildSizedBoxField(16.0),
        ],
      ),
    );
  }

  buildPayNowButtonField() {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent,
          onPrimary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        child: Text("Şimdi Öde"),
        onPressed: () {
          if (selectedValue == 0) {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text("Bakiye yükleme"),
                      content:
                          const Text("İşleminiz başarı ile gerçekleşmiştir!"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'Tamam');
                            },
                            child: Text("Tamam"))
                      ],
                    ));
          } else if (selectedValue == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentScreen()));
          }
        },
      ),
    );
  }

  buildSizedBoxField(height) {
    return SizedBox(
      height: height,
    );
  }

  List<DropdownMenuItem<DigitalCards>> buildDropDownMenuItems(
      List<DigitalCards> dropdownItems) {
    List<DropdownMenuItem<DigitalCards>> items = [];
    for (DigitalCards dropdownItem in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(dropdownItem.name),
        value: dropdownItem,
      ));
    }
    return items;
  }

  buildChoiceText() {
    return Center(
      child: Text(
        "Bakiye yükleyeceğiniz dijital kartı seçiniz.",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  buildPaymentChoiceText() {
    return Center(
      child: Text(
        "Hangi yöntemle ödeme yapmak istiyorsunuz?",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
