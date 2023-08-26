import 'package:babisappka/components/icons.dart';
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
          selectedOption.value = ''; // aby po tom co ziska vysledek se nemuselo na selectwidget klikat 2x
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

              return resultWidgetDesign(scannedYet, result, vyslednaFirma);
            }
          },
        );
      },
    );
  }

  Center resultWidgetDesign(bool scannedYet, String result, ResultData? vyslednaFirma) {
    return Center(
      // bez singlescrollview nefunguje klavesnice v manualtype widgetu poradne (byva tam overflow)
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Pokud se ještě neskenovalo, vrátí ikonku skenneru
            if (!scannedYet) ...[
              // const Text(
              //   "[Zvolte možnost]",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
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
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: vyslednaFirma!.holding == HoldingType.mimoHolding
                    ? goodResult()
                    : vyslednaFirma.holding == HoldingType.nejasne
                        ? idkResultIcon
                        : badResult(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  "Výrobce\n${vyslednaFirma.nazev}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              if (vyslednaFirma.dodatek.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text("Poznámka: ${vyslednaFirma.dodatek}", textAlign: TextAlign.center),
                ),
              ]
            ],
          ],
        ),
      ),
    );
  }

  Column badResult() {
    return const Column(
      children: [
        // Text("[Tento produkt vyprodukovalo Babišovo impérium]"),
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage('assets/babisANO.png'),
          height: 300,
          width: 200,
        ),
      ],
    );
  }

  Column goodResult() {
    return const Column(
      children: [
        // Text("[Tento produkt Babiš nevlastní]"),
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage('assets/babisNE.png'),
          height: 300,
          width: 200,
        ),
      ],
    );
  }
}
