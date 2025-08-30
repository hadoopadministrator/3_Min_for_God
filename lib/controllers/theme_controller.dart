import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Read saved theme mode or default to false
    isDarkMode.value = _box.read('isDarkMode') ?? false;
  }

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    _box.write('isDarkMode', value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}
