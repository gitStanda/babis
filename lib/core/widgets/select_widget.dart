import 'package:babisappka/core/notifiers.dart';
import 'package:flutter/material.dart';

import '../../components/icons.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDark, child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // neni vybrany scan
                      if ((selectedOption.value == '' || selectedOption.value == 'Manual')) {
                        selectedOption.value = 'Scan';
                      }
                      // je vybrany Manual a je vysledek -> vrati se do ManualWidget
                      else if ((selectedOption.value == 'Scan' && scanResult.value.isNotEmpty)) {
                        scanResult.value = '';
                        selectedOption.value = 'Scan';
                      }
                      // je vybrany scan a neni vysledek -> vrati se do menu
                      else {
                        scanResult.value = '';
                        selectedOption.value = '';
                      }
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.onSecondary,
                      child: Center(
                        child: isDark ? barcodeScanIconWhite : barcodeScanIconBlack,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      // neni vybrany Manual
                      if ((selectedOption.value == '' || selectedOption.value == 'Scan')) {
                        selectedOption.value = 'Manual';
                      }
                      // je vybrany Manual a je vysledek -> vrati se do ManualWidget
                      else if ((selectedOption.value == 'Manual' && scanResult.value.isNotEmpty)) {
                        scanResult.value = '';
                        selectedOption.value = 'Manual';
                      }
                      // je vybrany Manual a neni vysledek -> vrati se do menu
                      else {
                        scanResult.value = '';
                        selectedOption.value = '';
                      }
                    },
                    child: Card(
                      color: Theme.of(context).colorScheme.onSecondary,
                      child: Center(
                        child: isDark ? typeCodeIconWhite : typeCodeIconBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
