import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            SvgPicture.asset(
              'assets/images/splash_background.svg',
              fit: BoxFit.cover,
            ),
            // Overlay container with text
            Container(
              height: 333,
              width: 333,
              margin: const EdgeInsets.symmetric(horizontal: 21),
              decoration: BoxDecoration(
                color: Color(0x214B8E96),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 102, bottom: 26),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
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
                        fontStyle: FontStyle.normal,
                        height: 1.0,
                        letterSpacing: 0,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
