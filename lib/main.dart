import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:three_min_for_god/controllers/audio_controller.dart';
import 'package:three_min_for_god/controllers/language_controller.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/screens/splash_screen.dart';
import 'package:three_min_for_god/translations/app_translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // initializes storage
  Get.put(LanguageController());
  Get.put(AudioController());
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        translations: AppTranslations(),
        locale: Get.find<LanguageController>().locale.value,
        fallbackLocale: AppTranslations.fallbackLocale,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: Get.find<ThemeController>().isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: '3 Min for God',
        home: const SplashScreen(),
      ),
    );
  }
}
