import 'package:flutter/material.dart';

void showDownloadToast(bool isSuccess, BuildContext context) {
  TextStyle textStyle = const TextStyle(color: Colors.white);
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      closeIconColor: Colors.white,
      content: isSuccess
          ? Text("Úspěšně staženo", style: textStyle)
          : Text("Nastala chyba při stahování\nJe k dispozici internet?", style: textStyle),
      elevation: 10,
      showCloseIcon: true,
    ),
  );
}
