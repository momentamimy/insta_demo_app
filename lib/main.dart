import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/theme/constants.dart';
import 'package:insta_demo_app/firebase_options.dart';
import 'package:insta_demo_app/injection_container.dart';
import 'package:insta_demo_app/my_app.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  InjectionContainer().init();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    saveLocale: true,
    startLocale: Q.selectedLocale,
    supportedLocales: Q.supportedLanguages,
    path: 'assets/translations',
    fallbackLocale: Q.selectedLocale,
    child: const MyApp(),
  ));
}
