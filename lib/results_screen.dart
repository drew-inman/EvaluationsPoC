import 'package:evaluations_poc/data/questions.dart';
import 'package:evaluations_poc/data/results.dart';
import 'package:evaluations_poc/models/quiz_answer.dart';
import 'package:evaluations_poc/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<QuizAnswer> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'user_answer': chosenAnswers[i].answer,
          'answer_score': chosenAnswers[i].score
        },
      );
    }
    return summary;
  }

  void _showTooltip(BuildContext context, double percentage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.black.withOpacity(0.7),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              percentage == 100.0 ? 'Really?' : 'Retake the evaluation and pick answers with higher numbers!',
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalScore = chosenAnswers.fold(0, (sum, answer) => sum + answer.score);
    final userScorePercentage = 100 * (totalScore / getMaxScore());
    final userScorePercentageColor = getQuizResultForScore(userScorePercentage).color;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Score: ',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '$totalScore',
                          style: GoogleFonts.lato(
                            color: userScorePercentageColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '/${getMaxScore()}',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  QuestionsSummary(summaryData, userScorePercentageColor),
                ],
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => _showTooltip(context, userScorePercentage),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text("Want a higher score?"),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text("Retake"),
            ),
          ],
        ),
      ),
    );
  }
}
