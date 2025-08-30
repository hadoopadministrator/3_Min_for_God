import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';

class NotificationMenuCardWidget extends StatelessWidget {
  const NotificationMenuCardWidget({
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
    final themeController = Get.find<ThemeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0], //
            colors: themeController.isDarkMode.value
                ? [Color(0xff0D0D0D), Color(0xff333333)]
                : [Color(0xffEEF2F2), Color.fromARGB(255, 246, 248, 249)],
          ),
          border: Border.all(
            width: 1,
            color: themeController.isDarkMode.value
                ? Color(0xffB9C1C9)
                : Color(0xffB9C1C9),
          ),
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
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "Lörem ipsum bil nevunar beren hexadoheten. Dyde\ninfradok, dihet. Pongen dra ett streck i",
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                height: 22.5,
                width: 50, // 539EA7
                decoration: BoxDecoration(
                  color: isSwitchEnabled
                      ? Color(0xff539EA7)
                      : themeController.isDarkMode.value
                      ? Color(0xff1D1D1D)
                      : Color(0xffE2E2E2),
                  borderRadius: BorderRadius.circular(50),
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
