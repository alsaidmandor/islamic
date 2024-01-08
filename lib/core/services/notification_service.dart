import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static Future<void> init() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/ic_logo',
      [
        NotificationChannel(
          channelKey: 'fixed_count',
          channelName: 'Fixed Count',
          enableVibration: false,
          defaultRingtoneType: DefaultRingtoneType.Notification,
          playSound: false,
          enableLights: true,
          locked: true,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: 'islamic',
        ),
      ],
      debug: true,
    );
  }

  void permissionRequest() {
    Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }

  // late Duration timeDifference;
  // void startTimer() {
  //   Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     DateTime now = DateTime.now();
  //
  //     if (nextPrayer!.isAfter(now)) {
  //       timeDifference = nextPrayer!.difference(now);
  //     }
  //   });
  // }

  Future<void> createPlantFoodNotification(Duration timeDifference) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 888,
        channelKey: 'basic_channel',
        showWhen: false,
        title: 'islamic',
        body: timeDifference.inHours == 0
            ? 'Next Prayer:  ${timeDifference!.inMinutes.remainder(60)} : ${timeDifference!.inSeconds.remainder(60)} '
            : 'Next Prayer: ${timeDifference!.inHours} : ${timeDifference!.inMinutes.remainder(60)} : ${timeDifference!.inSeconds.remainder(60)} ',
      ),
    );
  }
}
