import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/screens/home_screen.dart';
import 'package:three_min_for_god/screens/language_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final box = GetStorage();
    bool isLanguageSelected = box.read('isLanguageSelected') ?? false;
    Timer(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLanguageSelected ? HomeScreen() : LanguageSelectionScreen(),
        ), (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
               fit:  BoxFit.fill,
              image: Svg(
                'assets/images/splash_background.svg',
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [          
                Container(
                  height: 333,
                  width: 333,
                  margin: const EdgeInsets.symmetric(horizontal: 21),
                  decoration: BoxDecoration(
                    color: Color(0x214B8E96),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/logos/logo.png',
                        fit: BoxFit.contain,
                        height: 120,
                        width: 120,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "3 MIN FOR GOD",
                        style: GoogleFonts.dmSerifText(
                          color: Color(0xff00335D),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 42),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          3,
                          (index) => Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Color(0xFF4B8E96),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
