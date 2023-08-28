import 'package:babisappka/components/icons.dart';
import 'package:babisappka/core/functions/open_fb.dart';
import 'package:babisappka/core/notifiers.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        title: const Text(
          'Nastavení',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () => myAboutDialog(context),
                  icons: settingsInfoIcon,
                  iconStyle: IconStyle(borderRadius: 20),
                  title: 'O aplikaci',
                  subtitle: "... zjisti víc!",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: const Color(0xFF642ef3),
                    borderRadius: 20,
                  ),
                  title: 'Tmavý režim',
                  // subtitle: "",
                  trailing: Switch.adaptive(
                    value: isDarkModeNotifier.value,
                    onChanged: (value) async {
                      setState(() {
                        isDarkModeNotifier.value = !isDarkModeNotifier.value;
                      });

                      // ulozit do preferenci
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isDarkMode', isDarkModeNotifier.value);
                    },
                  ),
                ),
              ],
            ),
            // TODO: monetization
            SettingsGroup(
              settingsGroupTitle: "Reklamy",
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.ad_units,
                  title: "Nastaveni reklamy?",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.monetization_on_rounded,
                  title: "Donate?",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void myAboutDialog(BuildContext context) => showAboutDialog(
          context: context,
          applicationName: "Babišovo?",
          // applicationIcon: Icon(Icons.man),
          applicationVersion: "0.69",
          applicationLegalese:
              'Aplikace je inspirovaná Android aplikací "Bez Holdingu", používá dokonce stejná data.\n\nJe postavena na open-source zdrojovém kódu gitStanda/babis, který je volně k dispozici na GitHubu.\n\nData jsou spravovaná Facebookovou skupinou Sorry Yako.',
          children: [
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
              onPressed: openFacebook,
              icon: const Icon(Icons.facebook_rounded),
              label: const Text("Sorry Yako"),
            )
          ]);
}
