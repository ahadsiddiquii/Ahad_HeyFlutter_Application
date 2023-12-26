import 'package:ahad_heyflutter_application/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/ui/configs/app_config/app_config.dart';
import 'src/ui/configs/app_config/environment_flavours_enum.dart';
import 'src/ui/configs/local_storage_sqflite/local_storage_sqflite.dart';

Future<void> main() async {
  //Settings
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //Local Database Setup
  await LocalStorageSqfLite.initDatabase();

  //Appconfig initialization
  AppConfig.init(
    environment: EnvironmentFlavours.staging,
    appVersionToShow: '0.0.0',
  );

  runApp(const App());
}
