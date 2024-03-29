import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'core/services/local/cache_helper.dart';
import 'core/services/local/local_database_register.dart';
import 'core/services/notification_service.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabaseRegister.initHive();
  await LocalDatabaseRegister.registerAdapter();
  await LocalDatabaseRegister.openHiveBox();
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Locks the app to portrait mode
  ]);
/*  Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  await Background.initializeService();*/
  NotificationService.init();
  runApp(const MyApp());
}
