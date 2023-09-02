import 'package:flutter/material.dart';

ValueNotifier<bool> isDarkModeNotifier = ValueNotifier(false);

ValueNotifier<String> scanResult = ValueNotifier('');

ValueNotifier<String> selectedOption = ValueNotifier('');

ValueNotifier<double> downloadProgress = ValueNotifier(0.0);
