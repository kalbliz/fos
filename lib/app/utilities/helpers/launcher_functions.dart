import 'dart:io';

import 'package:fos/app/utilities/dialogues/general_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makeLocalPhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> smsLaunchUri(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'sms',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}



Future<void> whatsappLaunchUrl(String phoneNumber) async {
  var contact = phoneNumber;
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl =
      "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    GeneralDialog().errorMessage('WhatsApp is not installed.');
  }
}

Future<void> openMap(
    {required double latitude, required double longitude}) async {
  Uri googleUri = Uri.parse("google.navigation:q=$latitude,$longitude&mode=d");
  Uri appleUri = Uri.parse("https://maps.apple.com/?sll=$latitude,$longitude");
  if (await canLaunchUrl(googleUri)) {
    await launchUrl(googleUri);
  } else if (await canLaunchUrl(appleUri)) {
    await launchUrl(appleUri);
  } else {
    throw 'Could not launch url';
  }
}
