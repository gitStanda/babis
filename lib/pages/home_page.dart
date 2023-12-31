import 'package:babisappka/components/start_dialogs.dart';
import 'package:babisappka/core/notifiers.dart';

import 'package:flutter/material.dart';

import 'package:babisappka/components/my_appbar.dart';

import 'package:babisappka/core/widgets/result_widget.dart';
import '../core/widgets/camera_widget.dart';
import '../core/widgets/manual_type_widget.dart';

import 'package:babisappka/core/widgets/select_widget.dart';

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
        return const ManualTypeWidget();
      } else {
        return const ResultWidget();
      }
    } else {
      return const ResultWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    // dialog pokud poprve zapnuta nebo je k dispozici nova databaze
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startDialogs(context, mounted);
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
