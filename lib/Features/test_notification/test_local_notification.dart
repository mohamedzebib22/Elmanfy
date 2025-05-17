import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TestLocalNotification extends StatelessWidget {
  const TestLocalNotification({super.key});
  static String id = 'TestLocalNotification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomBotton(title: 'BasicLocal'),
        CustomBotton(title: 'repeatedLocal'),
        CustomBotton(title: 'schedualLocal'),
      ],),
    );
  }
}