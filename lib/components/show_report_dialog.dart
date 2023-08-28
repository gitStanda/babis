import 'package:babisappka/core/functions/open_fb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showReportDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: const Text('Nahlásit chybu'),
      content: const Text(
          'Veškeré chyby databáze nahlašuj ve skupině "Sorry Yako" na FB - klidně jako anonym - ta se o data stará.'),
      actions: [
        TextButton.icon(
          onPressed: openFacebook,
          icon: const Icon(Icons.facebook_rounded),
          label: const Text("Sorry Yako"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "OK",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ],
    ),
  );
}
