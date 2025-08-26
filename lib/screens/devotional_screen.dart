import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DevotionalScreen extends StatefulWidget {
  const DevotionalScreen({super.key});

  @override
  State<DevotionalScreen> createState() => _DevotionalScreenState();
}

class _DevotionalScreenState extends State<DevotionalScreen> {
  bool playPause = true;
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
          "Devotional",
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
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/devotional_background.png'),
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    colors: [Color(0xffFFFFFF), Color(0x14FFFFFF)],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Petitions",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        letterSpacing: -0.02 * 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Slider(
                            min: 50.0,
                            max: 300.0,
                            activeColor: Colors.white,
                            inactiveColor: Color(0x4DFFFFFF),
                            onChanged: (value) {},
                            value: 200,
                          ),
                        ),
                        Text(
                          "-1:40",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.02 * 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPictureWidget(
                          onTap: () {},
                          iconPath: 'assets/icons/repeate_music.svg',
                        ),
                        SvgPictureWidget(
                          onTap: () {},
                          iconPath: 'assets/icons/next.svg',
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              playPause = !playPause;
                            });
                            _playPause();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SvgPicture.asset(
                              playPause
                                  ? 'assets/icons/pause.svg'
                                  : 'assets/icons/play.svg',
                              height: 28,
                              width: 28,
                              fit: BoxFit.none,
                              colorFilter: ColorFilter.mode(
                                Color(0xff112022),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        SvgPictureWidget(
                          onTap: () {},
                          iconPath: 'assets/icons/previous.svg',
                        ),
                        SvgPictureWidget(
                          onTap: () {},
                          iconPath: 'assets/icons/volume_high.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  void _playPause() {
    // var player = AudioPlayer();
        // player.play(AssetSource('note$number.wav'));
  }
}

class SvgPictureWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  const SvgPictureWidget({
    super.key,
    required this.onTap,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        height: 32,
        width: 32,
        fit: BoxFit.none,
      ),
    );
  }
}
