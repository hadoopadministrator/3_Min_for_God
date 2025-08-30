import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:three_min_for_god/controllers/language_controller.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/screens/about_us_screen.dart';
import 'package:three_min_for_god/screens/choose_language_screen.dart';
import 'package:three_min_for_god/screens/set_notification_timing_screen.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';
import 'package:three_min_for_god/widgets/scaffold_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LanguageController controller = Get.find<LanguageController>();
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBarTitle: 'settings'.tr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Obx(
              () => MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/theme.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'theme'.tr,
                trailingWidget: InkWell(
                  onTap: () {
                    themeController.toggleTheme(
                      !themeController.isDarkMode.value,
                    );
                  },
                  child: Container(
                    height: 22.5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: themeController.isDarkMode.value
                          ? Color(0xff539EA7)
                          : Color(0xffE2E2E2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: themeController.isDarkMode.value
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      height: 17.5,
                      width: 17.5,
                      margin: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          themeController.isDarkMode.value
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
              ),
            ),
            const SizedBox(height: 16),
            MenuCardWidget(
              widget: Icon(
                Icons.language,
                color: themeController.isDarkMode.value
                    ? Color(0xff539EA7)
                    : Color(0xff4B8E96),
                size: 24,
              ),
              lable: 'language'.tr,
              trailingText: controller.locale.value.languageCode.toUpperCase(),
              trailingWidget: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChooseLanguageScreen(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xff4B8E96),
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetNotificationTimingScreen(),
                  ),
                );
              },
              child: MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/notifications.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'set_notification_timing'.tr,
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
              child: MenuCardWidget(
                widget: Icon(
                  Icons.info,
                  color: themeController.isDarkMode.value
                      ? Color(0xff539EA7)
                      : Color(0xff4B8E96),
                  size: 24,
                ),
                lable: 'about_us'.tr,
              ),
            ),
            const SizedBox(height: 16),
            MenuCardWidget(
              widget: SvgPicture.asset(
                'assets/icons/contact_us.svg',
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                  themeController.isDarkMode.value
                      ? Color(0xff539EA7)
                      : Color(0xff4B8E96),
                  BlendMode.srcIn,
                ),
              ),
              lable: 'contact_us'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
