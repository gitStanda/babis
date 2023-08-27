import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<void> openFacebook() async {
  String fbProtocolUrl;
  if (Platform.isIOS) {
    fbProtocolUrl = 'fb://profile/3382356618517340/';
  } else {
    fbProtocolUrl = 'fb://page/3382356618517340/';
  }

  String fallbackUrl = 'https://www.facebook.com/3382356618517340/';

  try {
    Uri fbBundleUri = Uri.parse(fbProtocolUrl);
    var canLaunchNatively = await canLaunchUrl(fbBundleUri);

    if (canLaunchNatively) {
      launchUrl(fbBundleUri);
    } else {
      await launchUrl(Uri.parse(fallbackUrl), mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    throw "$e";
  }
}
