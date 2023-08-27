import 'package:babisappka/core/functions/is_new_version.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:babisappka/components/my_appbar.dart';

import 'package:babisappka/core/widgets/result_widget.dart';
import '../core/widgets/camera_widget.dart';
import '../core/widgets/manual_type_widget.dart';

import 'package:babisappka/core/widgets/select_widget.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:babisappka/core/notifiers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget getResultWidget() {
    if (scanResult.value == '') {
      if (selectedOption.value == 'Scan') {
        return const CameraWidget();
      } else if (selectedOption.value == 'Manual') {
        return ManualTypeWidget();
      } else {
        return const ResultWidget();
      }
    } else {
      return const ResultWidget();
    }
  }

  newVersionDialog() async {
    bool hasInternet = await InternetConnectionChecker().hasConnection;
    if (hasInternet) {
      bool isNewData = await isNewVersion();
      if (mounted) {
        if (isNewData) {
          await showDialog(
            context: context,
            builder: (_) => CupertinoAlertDialog(
              title: const Text('K dispozici jsou nová data, stáhni si je v "Databázi".'),
              content: Image.asset("assets/babis.gif"),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                )
              ],
            ),
            barrierDismissible: true,
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      newVersionDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: myAppBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: scanResult,
                builder: (context, scanResult, _) => ValueListenableBuilder(
                  valueListenable: selectedOption,
                  builder: (context, selectedOption, child) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                      child: getResultWidget(),
                    );
                  },
                ),
              ),
            ),
            // const Divider(),

            const SizedBox(
              width: 400,
              height: 150,
              child: SelectWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
