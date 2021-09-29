import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key key}) : super(key: key);

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;
  Barcode barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            child: buildTextField(),
            bottom: 200,
          ),
          Positioned(
            child: buildControllerButton(),
            top: 10,
          )
        ],
      ),
    ));
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).accentColor,
        borderWidth: 10,
        borderLength: 20,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) {
      //if dedect a barcode

      showAlertDialog();
      dispose();
    });
  }

  buildTextField() {
    return Text(
      "Kodu çerçevenin içerisine hizalayın",
      style: TextStyle(color: Colors.white),
    );
  }

  buildControllerButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FutureBuilder<bool>(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(
                  snapshot.data ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white,
                );
              } else {
                return Container();
              }
            },
          ),
          onPressed: () async {
            await controller?.toggleFlash();
            setState(() {});
          },
        )
      ],
    );
  }

  showAlertDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("İniş işlemi"),
              content: const Text(
                  "İşleminiz başarı ile gerçekleşmiştir! Ücret iadeniz en kısa sürede gerçekleştirilecektir."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context, rootNavigator: true).pop(context);
                    },
                    child: Text("Tamam"))
              ],
            ));
  }
}
