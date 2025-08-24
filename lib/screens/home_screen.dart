import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final List<String> _iconLabels = ['Ask Cathy', '', 'AI Faith Coach'];

  final List<Widget> _pages = const [
    MainContainer(),
    MainContainer(),
    MainContainer(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Good morning!',
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Prayer',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerWidget(
                iconPath: 'assets/icons/devotional.svg',
                iconTitle: 'Devotional',
                onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevotionalScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              ContainerWidget(
                iconPath: 'assets/icons/petitions.svg',
                iconTitle: 'Petitions',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerWidget(
                iconPath: 'assets/icons/request.svg',
                iconTitle: 'Request',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestPrayerScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              ContainerWidget(
                iconPath: 'assets/icons/animonks.svg',
                iconTitle: 'Animonks',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimonksScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String iconPath;
  final String iconTitle;
  final VoidCallback onTap;
  const ContainerWidget({
    super.key,
    required this.iconPath,
    required this.iconTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 115,
        width: 160,
        padding: const EdgeInsets.only(left: 40, bottom: 14, right: 40),
        decoration: BoxDecoration(
          color: Color(0x1AFFFFFF), // Color(0x1AFFFFFF)
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                iconPath,
                // 'assets/icons/devotional.svg',
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 17),
              Text(
                iconTitle,
                // 'Devotional',
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
      ),
    );
  }
}
