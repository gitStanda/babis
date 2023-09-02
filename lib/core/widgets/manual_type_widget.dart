import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../notifiers.dart';

class ManualTypeWidget extends StatelessWidget {
  ManualTypeWidget({super.key});
  final TextEditingController _textEditingController = TextEditingController();

  void _updateScanResult(BuildContext context) {
    final String enteredBarcode = _textEditingController.text;

    scanResult.value = enteredBarcode;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(20)],
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: 'Napiš čárový kód...',
            prefixIcon: const Icon(CupertinoIcons.barcode),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _updateScanResult(context),
          child: const Text('Najít'),
        ),
      ],
    );
  }
}
