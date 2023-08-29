import 'package:babisappka/components/show_report_dialog.dart';
import 'package:babisappka/core/functions/download_data.dart';
import 'package:babisappka/core/functions/data_version.dart';
import 'package:babisappka/core/models/data_version_model.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  DataPageState createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  DataVersionModel? localDataVersion;
  DataVersionModel? newDataVersion;

  @override
  void initState() {
    super.initState();
    loadLocalDataVersion().then((loadedLocalDataVersion) {
      setState(() {
        localDataVersion = loadedLocalDataVersion;
      });
    });

    getNewDataVersion().then((loadedNewDataVersion) {
      setState(() {
        newDataVersion = loadedNewDataVersion;
      });
    });
  }

  TextStyle versionStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: const Text('Databáze'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              localDataVersion != null
                  ? Text('Verze databáze v aplikaci: ${localDataVersion!.datum!}', style: versionStyle)
                  : Text('Verze databáze v aplikaci není k dispozici', style: versionStyle),
              const SizedBox(height: 16),
              newDataVersion != null
                  ? Text('Verze databáze ke stažení: ${newDataVersion!.datum!}', style: versionStyle)
                  : Text('Verze databáze ke stažení není k dispozici', style: versionStyle),
              Divider(
                thickness: 2,
                color: Colors.black.withOpacity(0.33),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ke správné identifikaci výrobců potřebuje aplikace občas aktualizovat svoje vnitřní data.\nAby to mohla udělat, musí se připojit k internetu. \n\nZapněte prosím mobilní data nebo WiFi a klikněte na tlačítko. Vše by se mělo vejít do objemu 0,5 MB.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),
              Center(
                child: OutlinedButton(
                  onPressed: () async {
                    bool success = await downloadData();
                    success ? showToast(true) : showToast(false);
                  },
                  child: const Text('Aktualizovat databázi'),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Stane-li se, že najdete v databázi chybu (např. špatně označuje výrobky), nahlašte ji v FB skupině "Sorry Yako".',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => showReportDialog(context),
                        child: const Text("Nahlásit chybu v databázi"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}
