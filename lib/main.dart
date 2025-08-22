import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:three_min_for_god/screens/splash_screen.dart';
import 'package:three_min_for_god/translations/app_translations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: AppTranslations.fallbackLocale,
      fallbackLocale: AppTranslations.fallbackLocale,
      debugShowCheckedModeBanner: false,
      title: '3 Min for God',
      home: const SplashScreen(),
    );
  }
}