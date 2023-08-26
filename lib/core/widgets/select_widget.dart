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
                      scanResult.value = '';
                      if (selectedOption.value == '' || selectedOption.value == 'Manual') {
                        selectedOption.value = 'Scan';
                      } else {
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
                      scanResult.value = '';
                      if (selectedOption.value == '' || selectedOption.value == 'Scan') {
                        selectedOption.value = 'Manual';
                      } else {
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
