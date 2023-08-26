import 'package:babisappka/core/functions/download_data.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  DataPageState createState() => DataPageState();
}

class DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktualizace dat'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  bool success = await downloadData();
                  success ? showToast(true) : showToast(false);
                },
                child: const Text('Aktualizovat data'),
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
