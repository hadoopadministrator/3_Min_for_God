import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';

class MenuCardWidget extends StatelessWidget {
  final Widget widget;
  final String lable;
  final String? trailingText;
  final Widget? trailingWidget;
  final Color? color;
  final Color? lableColor;
  const MenuCardWidget({
    super.key,
    required this.widget,
    required this.lable,
    this.trailingText,
    this.trailingWidget,
    this.color,
    this.lableColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color:
            color ??
            (themeController.isDarkMode.value
                ? Color(0xff0D0D0D)
                : Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(left: 10, top: 16, right: 14, bottom: 16),
      child: Row(
        children: [
          widget,
          const SizedBox(width: 19),
          Text(
            lable,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.3,
              letterSpacing: -0.02 * 16,
              color:
                  lableColor ??
                  (themeController.isDarkMode.value
                      ? Color(0xffDDECEE)
                      : Color(0xff112022)),
            ),
          ),
          const Spacer(),
          Text(
            trailingText ?? '',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.3,
              letterSpacing: -0.02 * 16,
              color: themeController.isDarkMode.value
                  ? Color(0xffDDECEE)
                  : Color(0xff112022),
            ),
          ),
          const SizedBox(width: 5),
          trailingWidget ?? Container(),
        ],
      ),
    );
  }
}
