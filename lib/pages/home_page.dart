import 'package:another_flushbar/flushbar.dart';
import 'package:babisappka/components/my_appbar.dart';
import 'package:babisappka/core/notifiers.dart';

import 'package:babisappka/core/widgets/result_widget.dart';
import 'package:babisappka/core/widgets/select_widget.dart';
import 'package:flutter/material.dart';

import '../core/widgets/camera_widget.dart';
import '../core/widgets/manual_type_widget.dart';

// import 'package:babisappka/widgets/title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // flushbar je ten text nad selectwidget
  Flushbar flush = Flushbar(
    messageText: const Center(child: Text("[Zvolte možnost]")),
    isDismissible: false,
    backgroundColor: Colors.black.withOpacity(0.1),
    margin: const EdgeInsets.only(bottom: 140),
    animationDuration: const Duration(microseconds: 1),
  );

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

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      flush.show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer, // barva aplikace
      appBar: myAppBar(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // ze zacatku jsem pouzival titlewidget, ale byl moc velky a nesedl tam
            // const TitleWidget(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: scanResult,
                builder: (context, scanResult, _) => ValueListenableBuilder(
                  valueListenable: selectedOption,
                  builder: (context, selectedOption, child) {
                    flush.dismiss();
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
