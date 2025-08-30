import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/theme_controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<String> iconPaths;
  final List<String> iconLabels;
  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.iconPaths,
    required this.iconLabels,
  });

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Container(
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Color(0xff0D0D0D)
            : Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(iconPaths.length, (index) {
          return InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 13),
                SvgPicture.asset(
                  iconPaths[index],
                  height: index == 1 ? 52 : 20,
                  width: index == 1 ? 52 : 20,
                  fit: BoxFit.none,
                ),
                const SizedBox(height: 4),
                Text(
                  iconLabels[index],
                  style: index == 1
                      ? TextStyle()
                      : GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.02 * 12,
                          color: Color(0xff93989D),
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
