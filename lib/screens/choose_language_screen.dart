import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:three_min_for_god/controllers/language_controller.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';
import 'package:three_min_for_god/widgets/scaffold_widget.dart';

class ChooseLanguageScreen extends StatelessWidget {
  ChooseLanguageScreen({super.key});

  final LanguageController controller = Get.find<LanguageController>();
  final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBarTitle: 'choose_your_language'.tr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                controller.changeLocale(const Locale('es', 'ES'));
              },
              child: MenuCardWidget(
                color: controller.locale.value.languageCode == "es"
                    ? themeController.isDarkMode.value
                          ? Color(0xff539EA7)
                          : Color(0xff4B8E96)
                    : themeController.isDarkMode.value
                    ? Color(0xff0D0D0D)
                    : Colors.white,
                widget: SvgPicture.asset(
                  'assets/icons/spanish_language_symbol.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    controller.locale.value.languageCode == "es"
                        ? themeController.isDarkMode.value
                              ? Color(0xff0D0D0D)
                              : Colors.white
                        : themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'Spanish',
                lableColor: controller.locale.value.languageCode == "es"
                    ? themeController.isDarkMode.value
                          ? Color(0xff0D0D0D)
                          : Colors.white
                    : themeController.isDarkMode.value
                    ? Color(0xffDDECEE)
                    : Color(0xff112022),
              ),
            ),
            const SizedBox(height: 19),
            InkWell(
              onTap: () {
                controller.changeLocale(const Locale('en', 'US'));
              },
              child: MenuCardWidget(
                color: controller.locale.value.languageCode == "en"
                    ? themeController.isDarkMode.value
                          ? Color(0xff539EA7)
                          : Color(0xff4B8E96)
                    : themeController.isDarkMode.value
                    ? Color(0xff0D0D0D)
                    : Colors.white,
                widget: SvgPicture.asset(
                  'assets/icons/english_language_symbol.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    controller.locale.value.languageCode == "en"
                        ? themeController.isDarkMode.value
                              ? Color(0xff0D0D0D)
                              : Colors.white
                        : themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'English',
                lableColor: controller.locale.value.languageCode == "en"
                    ? themeController.isDarkMode.value
                          ? Color(0xff0D0D0D)
                          : Colors.white
                    : themeController.isDarkMode.value
                    ? Color(0xffDDECEE)
                    : Color(0xff112022),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
