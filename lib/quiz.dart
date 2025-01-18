import 'package:evaluations_poc/data/questions.dart';
import 'package:evaluations_poc/models/quiz_answer.dart';
import 'package:evaluations_poc/questions_screen.dart';
import 'package:evaluations_poc/results_screen.dart';
import 'package:evaluations_poc/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<QuizAnswer> selectedAnswers = [];
  int totalScore = 0;
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    selectedAnswers = [];
    totalScore = 0;
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(QuizAnswer answer) {
    selectedAnswers.add(answer);
    totalScore += answer.score;

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        onRestart: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.blueAccent]),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
