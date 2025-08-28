import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_min_for_god/controllers/audio_controller.dart';
import 'package:three_min_for_god/screens/animonks_screen.dart';
import 'package:three_min_for_god/screens/devotional_screen.dart';
import 'package:three_min_for_god/screens/request_prayer_screen.dart';
import 'package:three_min_for_god/screens/crosswords_screen.dart';
import 'package:three_min_for_god/screens/settings_screen.dart';
import 'package:three_min_for_god/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> _iconPaths = [
    'assets/icons/ask_ai.svg',
    'assets/icons/crosswords.svg',
    'assets/icons/faith_ai.svg',
  ];

  final List<String> _iconLabels = ['ask_cathy'.tr, '', 'ai_faith_coach'.tr];

  final List<Widget> _pages = const [
    MainContainer(),
    MainContainer(),
    MainContainer(),
  ];

  /// Greeting based on time of day
  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'good_morning'.tr;
    if (hour < 17) return 'good_afternoon'.tr;
    return 'good_evening'.tr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          getGreetingMessage(),
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.02 * 18,
            color: Color(0xff112022),
          ),
        ),

        actionsPadding: const EdgeInsets.only(right: 20),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CrosswordsScreen()),
            );
          }
        },
        iconPaths: _iconPaths,
        iconLabels: _iconLabels,
      ),
      body: SafeArea(child: _pages[_currentIndex]),
    );
  }
}

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  /// Get devotional song based on current time
  String getDevotionalSong() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'musics/devotional_morning.mp3'; // Morning song
    } else if (hour < 16) {
      return 'musics/devotional_afternoon.mp3'; // Afternoon song
    } else {
      return 'musics/devotional_evening.mp3'; // Evening song
    }
  }

  /// Get Petition song based on current weekday
  String getPetitionSong() {
    final weekday = DateTime.now().weekday; // 1=Mon, 7=Sun
    switch (weekday) {
      case DateTime.monday:
        return 'musics/petition_mon.mp3';
      case DateTime.tuesday:
        return 'musics/petition_tue.mp3';
      case DateTime.wednesday:
        return 'musics/petition_wed.mp3';
      case DateTime.thursday:
        return 'musics/petition_thu.mp3';
      case DateTime.friday:
        return 'musics/petition_fri.mp3';
      case DateTime.saturday:
        return 'musics/petition_sat.mp3';
      case DateTime.sunday:
        return 'musics/petition_sun.mp3';
      default:
        assert(false, "Invalid weekday");
        return 'musics/petition_mon.mp3'; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<AudioController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'choose_prayer'.tr,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.3,
              letterSpacing: -0.02 * 20,
              color: Color(0xff112022),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ContainerWidget(
                  iconPath: 'assets/icons/devotional.svg',
                  iconTitle: 'devotional'.tr,
                  onTap: () {
                    final songPath = getDevotionalSong();
                    final category = 'devotional'.tr;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevotionalScreen(
                          title: category,
                          songPath: songPath, // Dynamic song
                          category: category,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ContainerWidget(
                  iconPath: 'assets/icons/petitions.svg',
                  iconTitle: 'petitions'.tr,
                  onTap: () {
                    final songPath = getPetitionSong();
                    final category = 'petitions'.tr;
                    audioController.play(
                      songPath: songPath,
                      category: category,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ContainerWidget(
                  iconPath: 'assets/icons/request.svg',
                  iconTitle: 'request'.tr,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestPrayerScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ContainerWidget(
                  iconPath: 'assets/icons/animonks.svg',
                  iconTitle: 'animonks'.tr,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnimonksScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
          const Spacer(),

          Obx(() {
            if (!audioController.hasSongPlayed.value) {
              return const SizedBox.shrink();
            }
            return InkWell(
              onTap: () {
                if (audioController.currentSongPath.value.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevotionalScreen(
                        title: audioController.currentCategory.value,
                        songPath: audioController.currentSongPath.value,
                        category: audioController.currentCategory.value,
                      ),
                    ),
                  );
                }
              },
              child: SongPlayWidget(),
            );
          }),
        ],
      ),
    );
  }
}

class SongPlayWidget extends StatelessWidget {
  const SongPlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<AudioController>();
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 16, bottom: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0], //
            colors: [Color(0xffEEF2F2), Color.fromARGB(255, 246, 248, 249)],
          ),
          border: Border.all(width: 1, color: Color(0xffB9C1C9)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/images/song_play_background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  audioController.currentSongPath.value.isEmpty
                      ? "now_playing".tr
                      : audioController.currentSongPath.value.split('/').last,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    letterSpacing: -0.02 * 14,
                    color: Color(0xff112022),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => audioController.play(
                    songPath: audioController.currentSongPath.value,
                    category: audioController.currentCategory.value,
                  ),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      audioController.isPlaying.value
                          ? 'assets/icons/pause.svg'
                          : 'assets/icons/play.svg',
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        Color(0xff112022),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: SvgPicture.asset(
                    'assets/icons/volume_high.svg',
                    fit: BoxFit.contain,
                    colorFilter: ColorFilter.mode(
                      Color(0xff112022),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    min: 0,
                    max: audioController.duration.value.inSeconds.toDouble(),
                    value: audioController.position.value.inSeconds
                        .toDouble()
                        .clamp(
                          0,
                          audioController.duration.value.inSeconds.toDouble(),
                        ),
                    activeColor: Color(0xff4B8E96),
                    inactiveColor: Color(0xffEBF0F5),
                    thumbColor: Colors.white,
                    onChanged: (value) async {
                      await audioController.seek(
                        Duration(seconds: value.toInt()),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 11),
                Text(
                  audioController.getRemainingTime(),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.02 * 12,
                    color: Color(0xff93989D),
                  ),
                ),
                const SizedBox(width: 37),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String iconPath;
  final String? iconTitle;
  final VoidCallback onTap;
  const ContainerWidget({
    super.key,
    required this.iconPath,
    this.iconTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 115,
        padding: const EdgeInsets.only(left: 40, bottom: 14, right: 40),
        decoration: BoxDecoration(
          color: Color(0x1AFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 17),
            Text(
              iconTitle ?? '',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.3,
                letterSpacing: -0.02 * 14,
                color: Color(0xff112022),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
