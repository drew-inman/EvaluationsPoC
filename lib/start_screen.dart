import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  static const startScreenText = 'Learn Flutter the fun way!';
  static const quizLogoImagePath = 'assets/images/quiz-logo.png';
  static const startScreenSizedBox = SizedBox(height: 30);
  static const startScreenBiggerSizedBox = SizedBox(height: 80);
  static const quizLogoColor = Color.fromARGB(150, 255, 255, 255);

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            quizLogoImagePath,
            width: 300,
            color: quizLogoColor,
          ),
          startScreenBiggerSizedBox,
          Text(
            startScreenText,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          startScreenSizedBox,
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
