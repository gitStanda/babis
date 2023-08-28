import 'package:babisappka/core/notifiers.dart';
import 'package:babisappka/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:babisappka/widget_tree.dart'; // spodni navigace

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // nacte dark / light preferenci
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false; // svetly mod pokud neexistuje

  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;

  const MyApp({required this.isDarkMode, super.key});

  @override
  Widget build(BuildContext context) {
    print(isDarkMode);
    isDarkModeNotifier.value = isDarkMode;

    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BabišAppka',
          theme: ThemeData(
            platform: TargetPlatform.iOS,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.teal.shade900, brightness: isDark ? Brightness.dark : Brightness.light),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
