import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/widgets/menu_card_widget.dart';

class RequestPrayerScreen extends StatelessWidget {
  const RequestPrayerScreen({super.key});

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
          "Request Prayer",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.02 * 18,
            color: Color(0xff112022),
          ),
        ),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
             const SizedBox(height: 24),
              MenuCardWidget(
                widget: SvgPicture.asset('assets/icons/health.svg',height: 24,width: 24,),
                lable: 'Health',
              ),
              const SizedBox(height: 19),
               MenuCardWidget(
                widget: SvgPicture.asset('assets/icons/celebration.svg',height: 24,width: 24,),
                lable: 'Birthday or Anniversary',
              ),
              const SizedBox(height: 19),
               MenuCardWidget(
                widget: SvgPicture.asset('assets/icons/other.svg',height: 24,width: 24,),
                lable: 'Other',
              ),
          ],
        ),
      )),
    );
  }
}