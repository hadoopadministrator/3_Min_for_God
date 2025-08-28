import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/audio_controller.dart';

class DevotionalScreen extends StatelessWidget {
  final String title;
  final String songPath;
  final String category;
  DevotionalScreen({
    super.key,
    required this.title,
    required this.songPath,
    required this.category,
  });

  final AudioController audioController = Get.find<AudioController>();

  @override
  Widget build(BuildContext context) {
    if (audioController.currentSongPath.value != songPath) {
      audioController.play(songPath: songPath, category: category);
    }
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
          title,
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
                      category,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        letterSpacing: -0.02 * 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      final maxDuration =
                          audioController.duration.value.inSeconds > 0
                          ? audioController.duration.value.inSeconds.toDouble()
                          : 1.0;
                      final currentPosition = audioController
                          .position
                          .value
                          .inSeconds
                          .toDouble()
                          .clamp(0.0, maxDuration);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Slider(
                              min: 0.0,
                              max: maxDuration,
                              value: currentPosition,
                              activeColor: Colors.white,
                              inactiveColor: Color(0x4DFFFFFF),
                              onChanged: (value) async {
                                audioController.seek(
                                  Duration(seconds: value.toInt()),
                                );
                              },
                            ),
                          ),
                          Text(
                            audioController.getRemainingTime(),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              letterSpacing: -0.02 * 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 28),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPictureWidget(
                            onTap: audioController.toggleRepeat,
                            iconPath: 'assets/icons/repeate_music.svg',
                            colorFilter: ColorFilter.mode(
                              audioController.isRepeatOn.value
                                  ? Color(0xff112022)
                                  : Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPictureWidget(
                            onTap: () {},
                            iconPath: 'assets/icons/next.svg',
                          ),
                          InkWell(
                            onTap: () {
                              audioController.play(
                                songPath: songPath,
                                category: category,
                              );
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
                                audioController.isPlaying.value
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
}

class SvgPictureWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final ColorFilter? colorFilter;
  const SvgPictureWidget({
    super.key,
    required this.onTap,
    required this.iconPath,
    this.colorFilter,
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
        colorFilter: colorFilter,
      ),
    );
  }
}
