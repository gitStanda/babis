import 'package:babisappka/core/notifiers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodeTab extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  CodeTab({super.key});

  void _updateScanResult(BuildContext context) {
    final String enteredBarcode = _textEditingController.text;

    scanResult.value = enteredBarcode;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: ListTile(
              leading: const Icon(CupertinoIcons.barcode),
              title: TextField(
                keyboardType: TextInputType.number,
                controller: _textEditingController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(20)
                ],
                decoration: const InputDecoration(hintText: 'Napiš čárový kód...', border: InputBorder.none),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  _textEditingController.clear();
                },
              ),
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
