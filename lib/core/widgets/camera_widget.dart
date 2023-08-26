import '../../packages/my_scanner.dart';
import 'package:babisappka/core/notifiers.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({super.key});

  bool isStringConvertibleToInt(String input) {
    try {
      int.parse(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AiBarcodeScanner(
      // ujisti se ze to je carovy kod
      validator: (value) {
        if (isStringConvertibleToInt(value)) {
          return true;
        } else {
          return false;
        }
      },
      controller: MobileScannerController(),
      onScan: (String value) {
        scanResult.value = value;
      },
      onDispose: () {
        debugPrint("Barcode scanner disposed!");
      },

      // overlay
      // showOverlay: false,
      cutOutSize: 0.0,
      cutOutWidth: 350,
      cutOutHeight: 150,
      cutOutBottomOffset: 15,

      hintText: "Naskenuj čárový kód",
      hintTextStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
    );
  }
}
