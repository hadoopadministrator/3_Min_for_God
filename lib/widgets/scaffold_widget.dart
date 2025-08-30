import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';

class ScaffoldWidget extends StatelessWidget {
  final String appBarTitle;
  final List<Widget>? actions;
  final Widget child;
  final Color? scaffoldBgColor;
  const ScaffoldWidget({
    super.key,
    required this.appBarTitle,
    this.actions,
    required this.child,
    this.scaffoldBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Scaffold(
      backgroundColor:
          scaffoldBgColor ??
          (themeController.isDarkMode.value
              ? Color(0xff1C1C1C)
              : Color(0xffEEF2F2)),
      appBar: AppBar(
        backgroundColor: themeController.isDarkMode.value
            ? Color(0xff0D0D0D)
            : Colors.white,
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsets.only(right: 20),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: themeController.isDarkMode.value
                ? Color(0xffDDECEE)
                : Color(0xff112022),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          appBarTitle,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.02 * 18,
            color: themeController.isDarkMode.value
                ? Color(0xffDDECEE)
                : Color(0xff112022),
          ),
        ),
        actions: actions,
      ),

      body: SafeArea(child: child),
    );
  }
}
