import 'package:babisappka/components/icons.dart';
import 'package:babisappka/components/show_report_dialog.dart';
import 'package:babisappka/core/functions/load_data.dart';
import 'package:babisappka/core/notifiers.dart';
import 'package:flutter/material.dart';

import '../functions/get_result.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scanResult,
      builder: (context, result, child) {
        // PROBÍHALO SKENOVÁNÍ?
        // Pozn.: result může být -1 pokud se zruší scanning
        bool scannedYet = (result.isEmpty || result.contains("-1")) ? false : true;

        Future<ResultData?> resultFuture;
        // pokud ano, ziska Result Data
        if (scannedYet) {
          resultFuture = getResultData(result);
        } else {
          resultFuture = Future.value(null);
        } // Placeholder future

        return FutureBuilder<ResultData?>(
          future: resultFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // kdyz ceka tak ukazat loading
              return const CircularProgressIndicator();
            } else {
              ResultData? vyslednaFirma = snapshot.data;
              return resultWidgetDesign(scannedYet, result, vyslednaFirma, context);
            }
          },
        );
      },
    );
  }

  resultWidgetDesign(bool scannedYet, String result, ResultData? vyslednaFirma, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Pokud se ještě neskenovalo, vrátí ikonku ruky
        if (!scannedYet) ...[
          Center(
            child: noResultIcon,
          ),

          // po skenovani
        ] else ...[
          Text(
            "Naskenováno: $result",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          Text(
            "Výrobce: ${vyslednaFirma!.nazev}",
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          vyslednaFirma.holding == HoldingType.mimoHolding
              ? goodResult()
              : vyslednaFirma.holding == HoldingType.nejasne
                  ? idkResultIcon
                  : vyslednaFirma.holding == HoldingType.putin
                      ? putinResult()
                      : badResult(),
          if (vyslednaFirma.zeme != null) ...[
            Text(
              "Země původu: ${vyslednaFirma.zeme}",
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
          if (vyslednaFirma.dodatek.isNotEmpty) ...[
            Text("Poznámka: ${vyslednaFirma.dodatek}", textAlign: TextAlign.center),
          ],
          TextButton(
            onPressed: () => showReportDialog(context),
            child: const Text("Nahlásit chybu"),
          ),
        ],
      ],
    );
  }

  badResult() {
    return const Image(
      image: AssetImage('assets/babisANO.png'),
      height: 300,
      width: 200,
    );
  }

  goodResult() {
    return const Image(
      image: AssetImage('assets/babisNE.png'),
      height: 300,
      width: 200,
    );
  }

  putinResult() {
    return const Image(
      image: AssetImage('assets/putin.gif'),
      height: 300,
      width: 200,
    );
  }
}
