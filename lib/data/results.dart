import 'package:evaluations_poc/models/quiz_result.dart';
import 'package:flutter/material.dart';

Map<String, QuizResult> results = {
  'SSS': const QuizResult('SSS', Color.fromARGB(255, 255, 196, 0)),
  'SS': const QuizResult('SS', Color(0xFFC0C0C0)),
  'S': const QuizResult('S', Color(0xFFCD7F32)),
  'A': const QuizResult('A', Colors.green),
  'B': const QuizResult('B', Color(0xFF9ACD32)),
  'C': const QuizResult('C', Colors.yellow),
  'D': const QuizResult('D', Colors.orange),
  'F': const QuizResult('F', Colors.red)
};

QuizResult getQuizResultForScore(double score) {
  if (score == 100) {
    return results['SSS']!;
  } else if (score == 99) {
    return results['SS']!;
  } else if (score == 98) {
    return results['S']!;
  } else if (score >= 90.0) {
    return results['A']!;
  } else if (score >= 80.0) {
    return results['B']!;
  } else if (score >= 70.0) {
    return results['C']!;
  } else if (score >= 60.0) {
    return results['D']!;
  } else if (score >= 0.0) {
    return results['F']!;
  } else {
    return const QuizResult('Result', Colors.grey);  // Default case for invalid scores
  }
}
