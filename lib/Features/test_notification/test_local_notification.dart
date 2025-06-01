import 'package:elmanfy/core/notification/local_notifications.dart';
import 'package:elmanfy/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TestLocalNotification extends StatelessWidget {
  const TestLocalNotification({super.key});
  static String id = 'TestLocalNotification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CustomBotton(title: 'BasicLocal',onTap: (){
          LocalNotificationsServices.showBasicNotification();
        },),
        SizedBox(height: 10,),
        CustomBotton(title: 'repeatedLocal',
        onTap: (){
          LocalNotificationsServices.cacelNotification(0);
        },
        ),
        CustomBotton(title: 'schedualLocal' ,onTap: ()async{
        // await LocalNotificationsServices.showSchduledNotification();
        },),
      ],),
    );
  }
}
