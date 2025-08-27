import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/language_controller.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';

class ChooseLanguageScreen extends StatelessWidget {
  ChooseLanguageScreen({super.key});

  final LanguageController controller = Get.find<LanguageController>();
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
          'choose_your_language'.tr,
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
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  controller.changeLocale(const Locale('es', 'ES'));
                },
                child: MenuCardWidget(
                  color: controller.locale.value.languageCode == "es"
                      ? const Color(0xff4B8E96)
                      : Colors.white,
                  widget: SvgPicture.asset(
                    'assets/icons/spanish_language_symbol.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.none,
                    colorFilter: controller.locale.value.languageCode == "es"
                        ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                        : null,
                  ),
                  lable: 'spanish'.tr,
                  lableColor: controller.locale.value.languageCode == "es"
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 19),
              InkWell(
                onTap: () {
                  controller.changeLocale(const Locale('en', 'US'));
                },
                child: MenuCardWidget(
                  color: controller.locale.value.languageCode == "en"
                      ? const Color(0xff4B8E96)
                      : Colors.white,
                  widget: SvgPicture.asset(
                    'assets/icons/english_language_symbol.svg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.none,
                    colorFilter: controller.locale.value.languageCode == "es"
                        ? const ColorFilter.mode(
                            Color(0xff4B8E96),
                            BlendMode.srcIn,
                          )
                        : null,
                  ),
                  lable: 'english'.tr,
                  lableColor: controller.locale.value.languageCode == "en"
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
