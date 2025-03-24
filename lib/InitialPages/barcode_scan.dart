import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String _scanResult = 'Scan a barcode';

  Future<void> scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE);

    if (barcode != '-1') {
      setState(() {
        _scanResult = barcode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scan Barcode'),
            ),
            SizedBox(height: 20),
            Text(
              'Scan result: $_scanResult',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
