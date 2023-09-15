import 'package:babisappka/components/show_report_dialog.dart';
import 'package:babisappka/core/functions/download_data.dart';
import 'package:babisappka/core/functions/data_version.dart';
import 'package:babisappka/core/functions/show_download_toast.dart';
import 'package:babisappka/core/models/data_version_model.dart';

import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  DataPageState createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  DataVersionModel? localDataVersion;
  DataVersionModel? newDataVersion;
  bool downloading = false;

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

  TextStyle versionStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Ke správné identifikaci výrobců potřebuje aplikace občas aktualizovat svoje vnitřní data.\nAby to mohla udělat, musí se připojit k internetu. \n\nZapněte prosím mobilní data nebo WiFi a klikněte na tlačítko. Vše by se mělo vejít do objemu 50 KB.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              downloading
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 16,
              ),
              OutlinedButton(
                onPressed: downloading
                    ? null
                    : () async {
                        setState(() {
                          downloading = true;
                        });
                        await downloadData().then((value) => value
                            ? showDownloadToast(true, context)
                            : showDownloadToast(false, context));

                        loadLocalDataVersion().then((loadedLocalDataVersion) {
                          setState(() {
                            localDataVersion = loadedLocalDataVersion;
                          });
                        });

                        setState(() {
                          downloading = false;
                        });
                      },
                child: const Text('Aktualizovat databázi'),
              ),
              const SizedBox(
                height: 32,
              ),
              localDataVersion != null
                  ? Text(
                      'Verze databáze v aplikaci: ${localDataVersion!.datum!}',
                      style: versionStyle)
                  : Text('Verze databáze v aplikaci není k dispozici',
                      style: versionStyle),
              const SizedBox(height: 16),
              newDataVersion != null
                  ? Text('Verze databáze ke stažení: ${newDataVersion!.datum!}',
                      style: versionStyle)
                  : Text('Verze databáze ke stažení není k dispozici',
                      style: versionStyle),
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
}
