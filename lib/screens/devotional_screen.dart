import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DevotionalScreen extends StatefulWidget {
   final String title;
  final String songPath;
  const DevotionalScreen({super.key, required this.title, required this.songPath});

  @override
  State<DevotionalScreen> createState() => _DevotionalScreenState();
}

class _DevotionalScreenState extends State<DevotionalScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  Future<void> _playPause() async {
    if (!isPlaying) {
      await _player.play(AssetSource(widget.songPath));
    } else {
      await _player.pause();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  @override
  void initState() {
    super.initState();
    _player.play(AssetSource(widget.songPath));
    isPlaying = true;
    _player.onDurationChanged.listen((eventDuration) {
      setState(() {
        _duration = eventDuration;
      });
    });
    _player.onPositionChanged.listen((eventPosition) {
      setState(() {
        _position = eventPosition;
      });
    });
    _player.onPlayerComplete.listen((event) async {
      if (_isRepeatOn) {
        await _player.stop();
        await _player.play(AssetSource(widget.songPath));
      } else {
        setState(() {
          isPlaying = false;
          _position = Duration.zero;
        });
      }
    });
  }

  String _formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  String getRemainingTime() {
    if (_duration == Duration.zero) {
      return "--:--";
    } else if (_position == Duration.zero && !isPlaying) {
      return "-${_formatTime(_duration)}";
    } else {
      return "-${_formatTime(_duration - _position)}";
    }
  }

  bool _isRepeatOn = false;

  void _toggleRepeat() {
    setState(() {
      _isRepeatOn = !_isRepeatOn;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

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
          widget.title,
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
                      'petitions'.tr,
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
                            min: 0,
                            max: _duration.inSeconds.toDouble(),
                            value: _position.inSeconds.toDouble().clamp(
                              0,
                              _duration.inSeconds.toDouble(),
                            ),
                            activeColor: Colors.white,
                            inactiveColor: Color(0x4DFFFFFF),
                            onChanged: (value) async {
                              final newPosition = Duration(
                                seconds: value.toInt(),
                              );
                               _player.seek(newPosition);
                            },
                          ),
                        ),
                        Text(
                          getRemainingTime(),
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
                          onTap: _toggleRepeat,
                          iconPath: 'assets/icons/repeate_music.svg',
                          colorFilter: ColorFilter.mode(
                            _isRepeatOn ? Color(0xff112022) : Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        SvgPictureWidget(
                          onTap: () {},
                          iconPath: 'assets/icons/next.svg',
                        ),
                        InkWell(
                          onTap: _playPause,
                          child: Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SvgPicture.asset(
                              isPlaying
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
