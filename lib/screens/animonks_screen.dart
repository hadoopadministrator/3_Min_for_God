import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/animonks_controller.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/widgets/scaffold_widget.dart';

class AnimonksScreen extends StatelessWidget {
  const AnimonksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final animonksController = Get.find<AnimonksController>();
    return ScaffoldWidget(
      appBarTitle: "animonks".tr,
      scaffoldBgColor: themeController.isDarkMode.value
          ? Color(0xff0D0D0D)
          : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() {
          final data = animonksController.todayData.value;
          if (data == null) {
            return const Center(
              child: Text("No data for today (Saturday/Sunday)"),
            );
          }
          final imagePath =
              'assets/images/${animonksController.currentAnimal.value.toLowerCase()}.jpg';

          return Column(
            children: [
              Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeController.isDarkMode.value
                      ? Color(0xff333333)
                      : Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 9),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeController.isDarkMode.value
                      ? Color(0xff1C1C1C)
                      : Color(0xffEEF2F2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: themeController.isDarkMode.value
                        ? Color(0xff2C4345)
                        : Color(0xffC9DBDD),
                    width: 1,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      Text(
                        "Day: ${data.day}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                          letterSpacing: -0.02 * 12,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        "Type: ${data.type}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                          letterSpacing: -0.02 * 12,
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: Text(
                          "Gratitude Prompt: ${data.gratitudePrompt}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.02 * 12,
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: Text(
                          "Learn: ${data.learn}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.02 * 12,
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 10,
                        ),
                        child: Text(
                          "Pray: ${data.pray}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.02 * 12,
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: themeController.isDarkMode.value
                          ? Color(0xff223344)
                          : Color(0xffCCD9E5),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 42,
                        spreadRadius: 0,
                        offset: Offset.zero,
                        color: Color(0x14031425),
                      ),
                    ],
                  ),
                  height: 42,
                  // width: 299,
                  alignment: Alignment.center,
                  child: Text(
                    'back_to_homepage'.tr,
                    style: GoogleFonts.poppins(
                      color: themeController.isDarkMode.value
                          ? Color(0xff0D0D0D)
                          : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      letterSpacing: -0.02 * 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 37),
            ],
          );
        }),
      ),
    );
  }
}
