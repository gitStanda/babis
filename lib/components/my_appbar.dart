import 'package:babisappka/components/icons.dart';
import 'package:babisappka/core/notifiers.dart';

import 'package:babisappka/pages/data_page.dart';
import 'package:babisappka/pages/settings_page.dart';
import 'package:flutter/material.dart';

AppBar myAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.black.withOpacity(0.1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
    title: Text(
      "Babišovo?",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 27,
        color: isDarkModeNotifier.value == false ? Colors.grey[850] : Colors.white,
      ),
    ),
    centerTitle: true,
    actions: [
      PopupMenuButton<int>(
        onSelected: (item) => onSelected(context, item),
        icon: const Padding(padding: EdgeInsets.only(right: 20), child: menuIcon),
        itemBuilder: (context) => [
          const PopupMenuItem<int>(
            value: 0,
            child: Text('Nastavení'),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text('Databáze'),
          ),
        ],
      ),
    ],
  );
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const DataPage()),
      );
      break;
  }
}
