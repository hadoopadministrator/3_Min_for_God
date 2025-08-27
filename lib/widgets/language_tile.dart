import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final bool selected;
  final ValueChanged<bool?>? onChanged;
  const LanguageTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.selected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(-1, 1),
            blurRadius: 69.7,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.10),
          ),
        ],
      ),
      height: 74,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        minVerticalPadding: 19.0,
        leading: SvgPicture.asset(
          iconPath,
          fit: BoxFit.contain,
          height: 36,
          width: 36,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                color: Color(0xff6F6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
            ),
          ],
        ),
        trailing: SizedBox(
          height: 24,
          width: 24,
          child: Radio(
            value: true,
            groupValue: selected,
            fillColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.selected)) {
                return Color(0xff0A7AFF);
              }
              return Color(0xff8E8E93);
            }),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
