// import 'package:babisappka/components/icons.dart';
// import 'package:babisappka/core/notifiers.dart';
// import 'package:babisappka/pages/home_page.dart';
// import 'package:babisappka/pages/download_page.dart';
// import 'package:flutter/material.dart';

// uz nepouzivam, mel jsem navigaci dole

// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});

//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }

// class _WidgetTreeState extends State<WidgetTree> {
//   int currentPage = 0;

//   // ALL PAGES
//   List<Widget> pages = const [
//     HomePage(),
//     DownloadPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages.elementAt(currentPage),
//       bottomNavigationBar: NavigationBar(
//         height: 50,
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
//         destinations: const [
//           NavigationDestination(
//             icon: navMain,
//             label: "Hlavní stránka",
//           ),
//           NavigationDestination(
//             icon: navSettings,
//             label: "Nastavení",
//           ),
//         ],
//         selectedIndex: currentPage,
//         onDestinationSelected: (int value) {
//           selectedOption.value = '';
//           scanResult.value = '';
//           setState(() {
//             currentPage = value;
//           });
//         },
//       ),
//     );
//   }
// }
