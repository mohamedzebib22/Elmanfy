

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class TelAndWatsapp {
 static Future<void> callClient({required String phone}) async {
    final Uri telUri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      debugPrint('Could not launch $telUri');
    }
  }
static Future<void> openWhatsApp({
  required String phoneNumber,
  required String message,
}) async {
 
  String currentNumber = phoneNumber.trim();

  if (currentNumber.startsWith('0')) {
    currentNumber = currentNumber.substring(1); 
  }

  currentNumber = '20$currentNumber'; 

  final whatsappUrl = Uri.parse(
    "https://wa.me/$currentNumber?text=${Uri.encodeComponent(message)}",
  );

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    throw '❌ لم يتمكن من فتح واتساب';
  }
}


}