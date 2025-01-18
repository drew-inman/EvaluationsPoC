import 'package:evaluations_poc/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  static const startScreenTitleText = 'Evaluations proof of concept';
  static final startScreenSubtitleText = '${questions.length} questions';
  static const startScreenSizedBox = SizedBox(height: 20);
  static const startScreenBiggerSizedBox = SizedBox(height: 60);

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 40.0,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              startScreenTitleText,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            startScreenSizedBox,
            Container(
              height: 2, // Height of the rectangle
              color: Colors.white, // Color of the rectangle
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 80,
              ),
            ),
            startScreenSizedBox,
            Text(
              startScreenSubtitleText,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            startScreenBiggerSizedBox,
            OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 80),
              ),
              label: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
