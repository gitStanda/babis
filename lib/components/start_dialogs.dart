import 'dart:io';

import 'package:babisappka/core/functions/download_data.dart';
import 'package:babisappka/core/functions/data_version.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

startDialogs(BuildContext context, mounted) async {
  bool hasInternet = await InternetConnectionChecker().hasConnection;
  // MÁ INTERNET
  if (hasInternet) {
    // pokud je to uplne poprve co uzivatel otevre appku a ma internet, stahne se databaze
    // FIRST TIME OPEN
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      if (mounted) {
        await showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: const Text(
                'Ahoj! Jelikož jsi zde poprvé, musím stáhnout nejnovější databázi (max 0.5 MB).\n\nPo kliknutí na "OK" mi dej chvilku.'),
            content: Image.asset("assets/babis.gif"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async {
                  Navigator.of(context).pop();

                  bool success = await downloadData();

                  showToast(success);
                  if (success) {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isFirstTime', false);
                  }
                },
                child: const Text("OK"),
              )
            ],
          ),
          barrierDismissible: true,
        );
      }
    }

    // dialog pokud jsou k dispozici nova data
    bool isNewData = await isNewVersion();
    if (mounted) {
      if (isNewData) {
        await showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: const Text('K dispozici jsou nová data, stáhni si je v "Databázi".'),
            content: Image.asset("assets/babis.gif"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              )
            ],
          ),
          barrierDismissible: true,
        );
      }
    }
  }
  // NEMÁ INTERNET
  else {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      if (mounted) {
        await showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
            title: const Text(
                'Ahoj! Aplikace funguje sice i offline, ale poprvé ji budeš muset zapnout s přístupem k internetu, aby mohla stáhnout databázi (max 0.5 MB).\n\nOmlouvám se za potíže a děkuji za pochopení.'),
            content: Image.asset("assets/babis.gif"),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  exit(0);
                },
                child: const Text("Vypnout aplikaci"),
              )
            ],
          ),
          barrierDismissible: false,
        );
      }
    }
  }
}

void showToast(bool isSuccess) {
  Fluttertoast.showToast(
    msg: isSuccess ? "Úspěšně staženo" : "Nastala chyba při stahování",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    textColor: Colors.white,
  );
}
