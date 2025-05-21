import 'dart:developer';

import 'package:elmanfy/core/notification/local_notifications.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  
  void registerMyTask() async {
    await Workmanager().registerOneOffTask('id 1', 'showNotification');
  }

  Future<void> init() async {
    await Workmanager().initialize(
        actionTask, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
    registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelByUniqueName(id);
  }
}
@pragma(
      'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
  void actionTask() {
    Workmanager().executeTask((taskName,inputData){
      LocalNotificationsServices.showBasicNotification();
      log('⚙️ WorkManager task started: $taskName');

      return Future.value(true);
    });
  }
