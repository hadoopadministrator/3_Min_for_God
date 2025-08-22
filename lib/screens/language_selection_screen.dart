import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/language_controller.dart';
import 'package:three_min_for_god/screens/home_screen.dart';
import 'package:three_min_for_god/widgets/language_tile.dart';

class LanguageSelectionScreen extends StatelessWidget {
  LanguageSelectionScreen({super.key});
  // Inject the controller
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            SvgPicture.asset(
              'assets/images/language_background.svg',
              fit: BoxFit.cover,
            ),
            // Overlay container with text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 67),
                  Image.asset(
                    'assets/logos/logo.png',
                    fit: BoxFit.contain,
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'choose_language'.tr,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'select_language'.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Color(0xff6F6E6E),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Obx(() {
                    return Column(
                      children: [
                        LanguageTile(
                          iconPath: 'assets/icons/flag_uk.svg',
                          title: 'ENGLISH',
                          subtitle: 'default_language'.tr,
                          selected:
                              controller.locale.value == Locale('en', 'US'),
                          onChanged: (value) {
                            controller.changeLocale(const Locale('en', 'US'));
                          },
                        ),
                        const SizedBox(height: 12),
                        LanguageTile(
                          iconPath: 'assets/icons/flag_spain.svg',
                          title: 'SPANISH',
                          subtitle: 'spanish_language'.tr,
                          selected:
                              controller.locale.value == Locale('es', 'ES'),
                          onChanged: (value) {
                            controller.changeLocale(const Locale('es', 'ES'));
                          },
                        ),
                      ],
                    );
                  }),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffEFF9FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 63,
                    width: 300,
                    child: Row(
                      children: [
                        Icon(Icons.error, color: Color(0xff4F46E5), size: 10),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Text(
                            'change_later'.tr,
                            style: GoogleFonts.poppins(
                              color: Color(0xff6F6E6E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 33),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      debugPrint('Selected Locale: ${controller.locale.value}');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff4B8E96),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      height: 56,
                      width: 299,
                      alignment: Alignment.center,
                      child: Text(
                        'continue'.tr,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 31),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
