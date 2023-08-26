import 'package:babisappka/components/icons.dart';
import 'package:babisappka/core/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nastavení'),
        centerTitle: true,
      ),
      body: const Column(),
      // dark / light mode
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          isDarkModeNotifier.value = !isDarkModeNotifier.value;

          // ulozit do preferenci
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isDarkMode', isDarkModeNotifier.value);
        },
        child: ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDark, child) {
            if (isDark) {
              return lightIcon;
            } else {
              return darkIcon;
            }
          },
        ),
      ),
    );
  }
}
