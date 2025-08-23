import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  // Current locale as observable
  var locale = Locale('en', 'US').obs;
   final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    String? storedLocale = box.read('selectedLanguage');
    if (storedLocale != null) {
      final parts = storedLocale.split('_');
      locale.value = Locale(parts[0], parts[1]);
      Get.updateLocale(locale.value);
    }
  }

  // Change app locale
  void changeLocale(Locale newLocale) {

    locale.value = newLocale;
    box.write('selectedLanguage', '${newLocale.languageCode}_${newLocale.countryCode}');
    Get.updateLocale(newLocale);
  }
}
