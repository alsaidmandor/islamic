import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Background {
  static late final DateTime nextPrayerr;

  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    /// OPTIONAL, using custom notification channel id
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_foreground', // id
      'MY FOREGROUND SERVICE', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.low, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    if (Platform.isIOS || Platform.isAndroid) {
      await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          iOS: DarwinInitializationSettings(),
          android: AndroidInitializationSettings('ic_logo'),
        ),
      );

      // await AwesomeNotifications().initialize(
      //   'resource://drawable/ic_logo',
      //   [
      //     NotificationChannel(
      //         channelKey: "count_fixed",
      //         channelName: "Count Fixed",
      //         channelDescription: "Notification channel for basic tests",
      //         importance: NotificationImportance.Max,
      //         channelShowBadge: false,
      //         locked: true,
      //         defaultRingtoneType: DefaultRingtoneType.Notification,
      //         enableVibration: true,
      //         onlyAlertOnce: true,
      //         playSound: true,
      //         criticalAlerts: true),
      //   ],
      //   debug: true,
      // );
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: true,
        isForegroundMode: true,

        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,

        // this will be executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: onIosBackground,
      ),
    );
  }

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch

  @pragma('vm:entry-point')
  static Future<bool> onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    final log = preferences.getStringList('log') ?? <String>[];
    log.add(DateTime.now().toIso8601String());
    await preferences.setStringList('log', log);

    return true;
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();

    // For flutter prior to version 3.0.0
    // We have to register the plugin manually

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("hello", "world");

    /// OPTIONAL when use custom notification
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    // bring to foreground
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          /// OPTIONAL for use custom notification
          /// the notification id must be equals with AndroidConfiguration when you call configure() method.
          flutterLocalNotificationsPlugin.show(
            888,
            'COOL SERVICE',
            'Awesome ${DateTime.now()}',
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'my_foreground',
                'MY FOREGROUND SERVICE',
                ongoing: true,
                importance: Importance.none,
                enableVibration: false,
                priority: Priority.low,
                channelShowBadge: false,
                sound: null,
                silent: true,
                audioAttributesUsage: AudioAttributesUsage.notification,
                playSound: true,
              ),
            ),
          );
          /*   late Duration timeDifference;
          DateTime now = DateTime.now();

          if (nextPrayerr!.isAfter(now)) {
            timeDifference = nextPrayerr!.difference(now);
          }
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
          );*/

          // if you don't using custom notification, uncomment this
          // service.setForegroundNotificationInfo(
          //     title: "My App Service", content: '${DateTime.now()}');
        }
      }
      // void startTimer() {
      //   Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //     DateTime now = DateTime.now();
      //
      //     if (nextPrayer!.isAfter(now)) {
      //       timeDifference = nextPrayer!.difference(now);
      //     }
      //   });
      // }
      // Future<void> createPlantFoodNotification(Duration timeDifference) async {
      //   await AwesomeNotifications().createNotification(
      //     content: NotificationContent(
      //       id: 888,
      //       channelKey: 'basic_channel',
      //       showWhen: false,
      //       title: 'islamic',
      //       body: timeDifference.inHours == 0
      //           ? 'Next Prayer:  ${timeDifference!.inMinutes.remainder(
      //           60)} : ${timeDifference!.inSeconds.remainder(60)} '
      //           : 'Next Prayer: ${timeDifference!.inHours} : ${timeDifference!
      //           .inMinutes.remainder(60)} : ${timeDifference!.inSeconds
      //           .remainder(60)} ',
      //     ),
      //   );
      // }

      /// you can see this log in logcat
      // print('FLUTTER BACKGROUND SERVICE: ${nextPrayerr.day}');

      // test using external plugin
      // final deviceInfo = DeviceInfoPlugin();
      // String? device;
      // if (Platform.isAndroid) {
      //   final androidInfo = await deviceInfo.androidInfo;
      //   device = androidInfo.model;
      // }
      //
      // if (Platform.isIOS) {
      //   final iosInfo = await deviceInfo.iosInfo;
      //   device = iosInfo.model;
      // }

      // service.invoke(
      //   'update',
      //   {
      //     "current_date": DateTime.now().toIso8601String(),
      //     "device": DateTime.now().toIso8601String(),
      //   },
      // );
    });
  }
}
