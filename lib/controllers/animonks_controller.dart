import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:three_min_for_god/models/animonks_data.dart';

class AnimonksController extends GetxController {
  var weeks = <AnimonksData>[].obs;
  var todayData = Rxn<DayData>();
  var currentAnimal = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadJson();
  }

  Future<void> loadJson() async {
    final jsonString = await rootBundle.loadString('assets/data/animonks.json');
    final jsonData = json.decode(jsonString);

    weeks.value = (jsonData['weeks'] as List)
        .map((week) => AnimonksData.fromJson(week))
        .toList();

    updateTodayData();
  }

  void updateTodayData() {
    final now = DateTime.now();
    final weekday = now.weekday; // Monday = 1, Sunday = 7

    // Saturday & Sunday = no data
    if (weekday == 6 || weekday == 7) {
      todayData.value = null;
      currentAnimal.value = '';
      return;
    }

    // Current week in the year
    // final currentWeekOfYear = weekNumber(now); 
     final currentWeekOfYear = 38;
    // Cycle 6 weeks
    final weekIndex = (currentWeekOfYear - 1) % 6;
    final weekData = weeks[weekIndex];

    todayData.value = weekData.days[weekday - 1]; // Monday = 0 index
    currentAnimal.value = weekData.animal;
  }

  int weekNumber(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final diff = date.difference(firstDayOfYear);
    return ((diff.inDays + firstDayOfYear.weekday) / 7).ceil();
  }
}