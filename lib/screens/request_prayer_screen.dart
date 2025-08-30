import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';
import 'package:three_min_for_god/screens/devotional_screen.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';
import 'package:three_min_for_god/widgets/scaffold_widget.dart';

class RequestPrayerScreen extends StatelessWidget {
  const RequestPrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return ScaffoldWidget(
      appBarTitle: 'request_prayer'.tr,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                final songPath = 'musics/request_illness.mp3';
                final category = 'health'.tr;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DevotionalScreen(
                      title: 'health'.tr,
                      songPath: songPath,
                      category: category,
                    ),
                  ),
                );
              },
              child: MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/health.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'health'.tr, //
              ),
            ),
            const SizedBox(height: 19),
            InkWell(
              onTap: () {
                final songPath = 'musics/request_birthday.mp3';
                final category = 'birthday_or_anniversary'.tr;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DevotionalScreen(
                      title: 'birthday_or_anniversary'.tr,
                      songPath: songPath,
                      category: category,
                    ),
                  ),
                );
              },
              child: MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/celebration.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'birthday_or_anniversary'.tr,
              ),
            ),
            const SizedBox(height: 19),
            InkWell(
              onTap: () {
                final songPath = 'musics/request_generic.mp3';
                final category = 'other'.tr;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DevotionalScreen(
                      title: 'other'.tr,
                      songPath: songPath,
                      category: category,
                    ),
                  ),
                );
              },
              child: MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/other.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    themeController.isDarkMode.value
                        ? Color(0xff539EA7)
                        : Color(0xff4B8E96),
                    BlendMode.srcIn,
                  ),
                ),
                lable: 'other'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
