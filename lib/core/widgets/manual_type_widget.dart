import 'package:flutter/material.dart';

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
          controller: _textEditingController,
          decoration: const InputDecoration(
            hintText: 'Napiš čárový kód...',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _updateScanResult(context),
          child: const Text('Hotovo'),
        ),
      ],
    );
  }
}
