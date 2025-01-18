import 'package:evaluations_poc/answer_button.dart';
import 'package:evaluations_poc/models/quiz_answer.dart';
import 'package:flutter/material.dart';
import 'package:evaluations_poc/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(QuizAnswer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  QuizAnswer? currentAnswer;
  var currentQuestionIndex = 0;

  void answerQuestion(QuizAnswer selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentAnswer = null;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.answers.map((answer) {
              bool isSelected = currentAnswer == answer;
              return AnswerButton(
                buttonText: answer.answer,
                buttonAction: () {
                  setState(() {
                    currentAnswer = answer;
                  });
                },
                isSelected: isSelected,
              );
            }),
            const SizedBox(
              height: 60,
            ),
            OutlinedButton.icon(
              onPressed: () {
                currentAnswer == null ? null : answerQuestion(currentAnswer!);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor:
                    currentAnswer == null ? Colors.grey : Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                ),
              ),
              label: const Text("Next Question"),
            ),
          ],
        ),
      ),
    );
  }
}
