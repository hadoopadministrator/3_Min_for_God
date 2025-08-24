import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CrosswordsScreen extends StatefulWidget {
  const CrosswordsScreen({super.key});

  @override
  State<CrosswordsScreen> createState() => _CrosswordsScreenState();
}

class _CrosswordsScreenState extends State<CrosswordsScreen> {
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
          "Crossword",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.3,
            letterSpacing: -0.02 * 18,
            color: Color(0xff112022),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showHowToPlayDialog();
            },
            child: SvgPicture.asset(
              'assets/icons/hint.svg',
              height: 26,
              width: 26,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            right: 30,
            left: 30,
            bottom: 46,
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, // 5 columns
                    crossAxisSpacing: 4, // horizontal gap
                    mainAxisSpacing: 4, // vertical gap
                  ),
                  itemCount: 30, // 6 x 5 = 30 boxes
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xff3A3A3A), width: 1),
                      ),
                      alignment: Alignment.center,
                      child: TextField(
                        showCursor: false,
                        cursorColor: Colors.transparent,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z]'),
                          ),
                        ],      
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(border: InputBorder.none,counterText: ''),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showHowToPlayDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Color(0x66D9D9D9),   
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: Dialog(
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.close_rounded, size: 24),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'HOW TO PLAY',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      letterSpacing: -0.02 * 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Guess the word in 6 tries',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      letterSpacing: -0.02 * 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    ' • Each guess must be a valid 5-letter word.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                      letterSpacing: -0.02 * 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' • ',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.02 * 20,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'The color of the tiles will change to show how\nclose your guess was to the word',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.02 * 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Examples",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                      letterSpacing: -0.02 * 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Example 1
                  WordRowWidget(
                    letters: ["W", "O", "R", "D", "Y"],
                    colors: [Color(0xffE1FCDF), null, null, null, null],
                    description: "is the word and in the correct spot.",
                  ),
                  const SizedBox(height: 10),
                  // Example 2
                  WordRowWidget(
                    letters: ["L", "I", "G", "H", "T"],
                    colors: [null, Color(0xffFFDDC3), null, null, null],
                    description: "is the word but in the wrong spot.",
                  ),
                  const SizedBox(height: 10),
                  // Example 3
                  WordRowWidget(
                    letters: ["R", "O", "G", "U", "E"],
                    colors: [null, null, null, Color(0xffD7D7D7), null],
                    description: "is not the word in any spot.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WordRowWidget extends StatelessWidget {
  final List<String> letters;
  final List<Color?> colors;
  final String description;
  const WordRowWidget({
    super.key,
    required this.letters,
    required this.colors,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // find the first highlighted letter
    final int highlightedIndex = colors.indexWhere(
      (c) => c != null,
    ); // -1 if none
    final String highlightedLetter = highlightedIndex != -1
        ? letters[highlightedIndex]
        : '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(letters.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: colors[index] ?? Colors.white,
                border: Border.all(color: Color(0xff7A7676), width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                letters[index],
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.16,
                  letterSpacing: -0.02 * 14,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.3,
              letterSpacing: -0.02 * 20,
              color: Colors.black,
            ),
            children: [
              if (highlightedLetter.isNotEmpty)
                TextSpan(
                  text: '$highlightedLetter ',
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    letterSpacing: -0.02 * 20,
                    color: Colors.black,
                  ),
                ),
              TextSpan(text: description),
            ],
          ),
        ),
      ],
    );
  }
}
