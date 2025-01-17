import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: itemData['question_index'],
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              // Text(
              //   itemData['correct_answer'] as String,
              //   style: const TextStyle(
              //     color: Color.fromARGB(150, 255, 255, 255),
              //   ),
              // ),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(
                  color: isCorrectAnswer ? Colors.greenAccent : Colors.pinkAccent,
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ],
    );
  }
}
