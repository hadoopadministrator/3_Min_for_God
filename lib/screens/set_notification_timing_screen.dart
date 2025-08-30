import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';
import 'package:three_min_for_god/widgets/notification_menu_card_widget.dart';
import 'package:three_min_for_god/widgets/scaffold_widget.dart';

class SetNotificationTimingScreen extends StatefulWidget {
  const SetNotificationTimingScreen({super.key});

  @override
  State<SetNotificationTimingScreen> createState() =>
      _SetNotificationTimingScreenState();
}

class _SetNotificationTimingScreenState
    extends State<SetNotificationTimingScreen> {
  final ThemeController themeController = Get.find<ThemeController>();

  bool weeklyNotifi = false;
  bool dailyNotifi = false;
  List<bool> dayCheck = List.generate(7, (_) => false);
  int? selectedWeeklyIndex;
  List<String> days = [
    'monday'.tr,
    'tuesday'.tr,
    'wednesday'.tr,
    'thursday'.tr,
    'friday'.tr,
    'saturday'.tr,
    'sunday'.tr,
  ];

  // store selected time for each day
  List<TimeOfDay?> dailyTimes = List.generate(7, (_) => null);
  TimeOfDay? weeklyTime;
  Future<void> _pickTime(int index, {bool isWeekly = false}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isWeekly
          ? (weeklyTime ?? TimeOfDay(hour: 12, minute: 0))
          : (dailyTimes[index] ?? TimeOfDay(hour: 12, minute: 0)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              entryModeIconColor: themeController.isDarkMode.value
                  ? Color(0xff3F4949)
                  : Color(0xff3F4949),
              backgroundColor: themeController.isDarkMode.value
                  ? Color(0xff212A2A)
                  : Color(0xffE3E9E9),
              dialBackgroundColor: themeController.isDarkMode.value
                  ? Color(0xff26302F)
                  : Color(0xffDDE4E3),
              dialHandColor: themeController.isDarkMode.value
                  ? Color(0xff008284)
                  : Color(0xff00696B),
              timeSelectorSeparatorColor: WidgetStateColor.resolveWith(
                (states) => themeController.isDarkMode.value
                    ? Color(0xffE2E9E9)
                    : Color(0xff161D1D),
              ),
              dialTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? themeController.isDarkMode.value
                          ? Color(0xff0D0D0D)
                          : Colors.white
                    : themeController.isDarkMode.value
                    ? Color(0xffE2E9E9)
                    : Color(0xff161D1D),
              ),
              hourMinuteColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? themeController.isDarkMode.value
                          ? Color(0x66008284)
                          : Color(0x6600696B)
                    : themeController.isDarkMode.value
                    ? Color(0xff26302F)
                    : Color(0xffDDE4E3),
              ),
              hourMinuteTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black
                    : themeController.isDarkMode.value
                    ? Color(0xffE2E9E9)
                    : Color(0xff161D1D),
              ),
              dayPeriodTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black
                    : Color(0xff3F4949),
              ),
              dayPeriodColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? themeController.isDarkMode.value
                          ? Color(0xff353535)
                          : Color(0xffD7D7D7)
                    : themeController.isDarkMode.value
                    ? Color(0xff212A2A)
                    : Color(0xffE3E9E9),
              ),

              dayPeriodBorderSide: BorderSide(
                color: Color(0xff6F7979),
                width: 1,
              ),
              helpTextStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.33,
                letterSpacing: 0.5,
                color: Color(0xff3F4949),
              ),
              hourMinuteTextStyle: TextStyle(
                fontSize: 57,
                fontWeight: FontWeight.w400,
                height: 1.123,
              ),
              dayPeriodTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
                letterSpacing: 0.15,
              ),
              dialTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                letterSpacing: 0.5,
              ),
              timeSelectorSeparatorTextStyle: WidgetStateTextStyle.resolveWith(
                (states) => TextStyle(
                  fontSize: 57,
                  fontWeight: FontWeight.w400,
                  height: 1.123,
                ),
              ),
            ),

            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: themeController.isDarkMode.value
                    ? Color(0xff008284)
                    : Color(0xff00696B),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.4286,
                  letterSpacing: 0.1,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isWeekly) {
          weeklyTime = picked;
        } else {
          dailyTimes[index] = picked;
        }
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBarTitle: 'set_notification_timing'.tr,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              NotificationMenuCardWidget(
                isSwitchEnabled: weeklyNotifi,
                onTap: () {
                  setState(() {
                    weeklyNotifi = !weeklyNotifi;
                    if (weeklyNotifi) dailyNotifi = false;
                  });
                },
                title: 'weekly_reflection'.tr,
              ),
              NotificationMenuCardWidget(
                isSwitchEnabled: dailyNotifi,
                onTap: () {
                  setState(() {
                    dailyNotifi = !dailyNotifi;
                    if (dailyNotifi) weeklyNotifi = false;
                  });
                },
                title: 'three_mins_for_god'.tr,
              ),
              if (dailyNotifi || weeklyNotifi)
                Column(
                  children: List.generate(days.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MenuCardWidget(
                        widget: SizedBox(
                          height: 24,
                          width: 24,
                          child: weeklyNotifi
                              ? Radio<int>(
                                  value: index,
                                  groupValue: selectedWeeklyIndex,

                                  fillColor:
                                      WidgetStateProperty.resolveWith<Color>((
                                        Set<WidgetState> states,
                                      ) {
                                        if (states.contains(
                                          WidgetState.selected,
                                        )) {
                                          return themeController
                                                  .isDarkMode
                                                  .value
                                              ? Color(0xff539EA7)
                                              : Color(0xff4B8E96);
                                        }
                                        return themeController.isDarkMode.value
                                            ? Color(0xff3F4949)
                                            : Color(0xff8E8E93);
                                      }),
                                  onChanged: (value) async {
                                    setState(() {
                                      selectedWeeklyIndex = value;
                                      weeklyTime ??= const TimeOfDay(
                                        hour: 12,
                                        minute: 0,
                                      );
                                    });
                                  },
                                )
                              : Checkbox(
                                  activeColor: themeController.isDarkMode.value
                                      ? Color(0xff539EA7)
                                      : Color(0xff4B8E96),
                                  checkColor: themeController.isDarkMode.value
                                      ? Color(0xff0D0D0D)
                                      : Color(0xffFFFFFF),
                                  side: BorderSide(
                                    width: 2,
                                    color: dayCheck[index]
                                        ? Colors.transparent
                                        : (themeController.isDarkMode.value
                                              ? Color(0xff3F4949)
                                              : Color(0xff8E8E93)),
                                  ),
                                  value: dayCheck[index],
                                  onChanged: (value) {
                                    setState(() {
                                      dayCheck[index] = value ?? false;
                                      if (dayCheck[index] &&
                                          dailyTimes[index] == null) {
                                        dailyTimes[index] = const TimeOfDay(
                                          hour: 12,
                                          minute: 0,
                                        );
                                      }

                                      if (!dayCheck[index]) {
                                        dailyTimes[index] = null;
                                      }
                                    });
                                  },
                                ),
                        ),
                        lable: days[index],
                        trailingText: weeklyNotifi
                            ? (selectedWeeklyIndex == index &&
                                      weeklyTime != null
                                  ? _formatTime(weeklyTime!)
                                  : '')
                            : (dayCheck[index] && dailyTimes[index] != null
                                  ? _formatTime(dailyTimes[index]!)
                                  : ''),
                        trailingWidget:
                            ((weeklyNotifi && selectedWeeklyIndex == index) ||
                                (dailyNotifi && dayCheck[index]))
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: InkWell(
                                  onTap: () =>
                                      _pickTime(index, isWeekly: weeklyNotifi),
                                  child: SvgPicture.asset(
                                    'assets/icons/edit_time.svg',
                                    height: 16,
                                    width: 16,
                                    colorFilter: ColorFilter.mode(
                                      themeController.isDarkMode.value
                                          ? Color(0xff539EA7)
                                          : Color(0xff4B8E96),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
