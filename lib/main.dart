import 'package:ahad_heyflutter_application/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
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
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey:
            'AIzaSyDn-t-Y1LqUTt53N5qYlPByprcin7JYbFY', // paste your api key here
        appId:
            '1:175455387296:android:119ee7b886a582e5cdd3c5', //paste your app id here
        messagingSenderId: '175455387296', //paste your messagingSenderId here
        projectId: 'ahad-heyflutter-application', //paste your project id here
      ),
    );
    if (Firebase.apps.isNotEmpty) {
      print('Firebase is initialized');
    } else {
      print('Firebase is not initialized');
    }
  } catch (e) {
    print(e.toString());
  }

  //Local Database Setup
  await LocalStorageSqfLite.initDatabase();

  //Appconfig initialization
  AppConfig.init(
    environment: EnvironmentFlavours.staging,
    appVersionToShow: '0.0.0',
  );

  runApp(const App());
}
