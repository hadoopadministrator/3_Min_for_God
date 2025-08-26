import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';

class SetNotificationTimingScreen extends StatefulWidget {
  const SetNotificationTimingScreen({super.key});

  @override
  State<SetNotificationTimingScreen> createState() =>
      _SetNotificationTimingScreenState();
}

class _SetNotificationTimingScreenState
    extends State<SetNotificationTimingScreen> {
  bool weeklyNotifi = false;
  bool dailyNotifi = false;
  List<bool> dayCheck = List.generate(7, (_) => false);
  List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  // store selected time for each day
  List<TimeOfDay?> selectedTimes = List.generate(7, (_) => null);

  Future<void> _pickTime(int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimes[index] ?? TimeOfDay.now(),
      builder: (context, child) {
         return Theme(data: Theme.of(context).copyWith(
          timePickerTheme: TimePickerThemeData(
            backgroundColor: Color(0xffE3E9E9),
            dialBackgroundColor: Color(0xffDDE4E3),
            dialHandColor: Color(0xff00696B)
          )
         ), child: child!);

      },
    );
    if (picked != null) {
      setState(() {
        selectedTimes[index] = picked;
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
    return Scaffold(
      backgroundColor: Color(0xffEEF2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsets.only(right: 20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Color(0xff112022),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.02 * 18,
            color: Color(0xff112022),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              NotificationCardWidget(
                isSwitchEnabled: weeklyNotifi,
                onTap: () {
                  setState(() {
                    weeklyNotifi = !weeklyNotifi;
                  });
                },
                title: "Weekly Reflection",
              ),
              NotificationCardWidget(
                isSwitchEnabled: dailyNotifi,
                onTap: () {
                  setState(() {
                    dailyNotifi = !dailyNotifi;
                  });
                },
                title: "Do you have 3 mins for god?",
              ),
              if (dailyNotifi == true)
                Column(
                  children: List.generate(days.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: MenuCardWidget(
                        widget: SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            activeColor: Color(0xff4B8E96),
                            value: dayCheck[index],
                            onChanged: (value) {
                              setState(() {
                                dayCheck[index] = value ?? false;
                                if (dayCheck[index] &&
                                    selectedTimes[index] == null) {
                                  selectedTimes[index] = const TimeOfDay(
                                    hour: 12,
                                    minute: 0,
                                  );
                                }

                                if (!dayCheck[index]) {
                                  selectedTimes[index] = null;
                                }
                              });
                            },
                          ),
                        ),
                        lable: days[index],
                        trailingText:
                            dayCheck[index] && selectedTimes[index] != null
                            ? _formatTime(selectedTimes[index]!)
                            : '',
                        trailingWidget: dayCheck[index] == true
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: InkWell(
                                  onTap: () => _pickTime(index),
                                  child: SvgPicture.asset(
                                    'assets/icons/edit_time.svg',
                                    height: 16,
                                    width: 16,
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

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.isSwitchEnabled,
    required this.onTap,
    required this.title,
  });

  final bool isSwitchEnabled;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffEEF2F2),
           border: Border.all(color: Color(0xffB9C1C9), width: 1),
          // gradient: LinearGradient(
          //   colors: [Color(0xffCCD9E5), Color(0xffB9C1C9)],
          // ),
        ),
      
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "Lörem ipsum bil nevunar beren hexadoheten. Dyde\ninfradok, dihet. Pongen dra ett streck i",
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                height: 22.5,
                width: 50,
                decoration: BoxDecoration(
                  color: isSwitchEnabled ? Color(0xff539EA7) : Color(0xffE2E2E2),
                  borderRadius: BorderRadius.circular(50),
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 8,
                  //     offset: Offset(0, 6),
                  //     color: Color(0x1A000000),
                  //     spreadRadius: 3,
                  //   ),
                  // ],
                ),
                alignment: isSwitchEnabled
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  height: 17.5,
                  width: 17.5,
                  margin: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      isSwitchEnabled
                          ? BoxShadow(
                              blurRadius: 6,
                              offset: Offset(-2, 1),
                              color: Color(0x40000000),
                              spreadRadius: 0,
                            )
                          : BoxShadow(
                              blurRadius: 6,
                              offset: Offset(2, 1),
                              color: Color(0x40000000),
                              spreadRadius: 0,
                            ),
                    ],
                    gradient: LinearGradient(
                      stops: [0.0, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white, Color(0xffE8EAEA)],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
