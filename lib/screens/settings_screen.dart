import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/language_controller.dart';
import 'package:three_min_for_god/screens/choose_language_screen.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              const SizedBox(height: 24),
              MenuCardWidget(
                widget: const Icon(
                  Icons.language,
                  color: Color(0xff4B8E96),
                  size: 24,
                ),
                lable: 'Language',
                trailingText: controller.locale.value.languageCode.toUpperCase(),
                trailingWidget: InkWell(
                  onTap: ()  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseLanguageScreen(),
                      ),
                    );     
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff4B8E96),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/notifications.svg',
                  height: 24,
                  width: 24,
                ),
                lable: 'Set Notification Timing',
              ),
              const SizedBox(height: 16),
              MenuCardWidget(
                widget: const Icon(
                  Icons.info,
                  color: Color(0xff4B8E96),
                  size: 24,
                ),
                lable: 'About Us',
              ),
              const SizedBox(height: 16),
              MenuCardWidget(
                widget: SvgPicture.asset(
                  'assets/icons/contact_us.svg',
                  height: 24,
                  width: 24,
                ),
                lable: 'Contact Us',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
