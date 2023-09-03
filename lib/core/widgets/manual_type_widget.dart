import 'package:babisappka/core/widgets/tabs/name_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs/code_tab.dart';

class ManualTypeWidget extends StatelessWidget {
  const ManualTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(CupertinoIcons.barcode),
                iconMargin: EdgeInsets.only(bottom: 5),
                text: "KÓD",
              ),
              Tab(
                icon: Icon(CupertinoIcons.pencil_outline),
                iconMargin: EdgeInsets.only(bottom: 5),
                text: "NÁZEV",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                CodeTab(),
                NameTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
