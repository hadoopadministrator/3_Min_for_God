import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  // Current locale as observable
  var locale = Locale('en', 'US').obs;

  // Change app locale
  void changeLocale(Locale newLocale) {
    locale.value = newLocale;
    Get.updateLocale(newLocale);
  }
}
