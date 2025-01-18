import 'package:evaluations_poc/models/quiz_answer.dart';
import 'package:evaluations_poc/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'Question 1?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 2?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 3?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 4?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 5?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 6?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 7?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 8?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 9?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
  QuizQuestion(
    'Question 10?',
    [
      QuizAnswer('Answer 1', 1),
      QuizAnswer('Answer 2', 2),
      QuizAnswer('Answer 3', 3),
      QuizAnswer('Answer 4', 4),
      QuizAnswer('Answer 5', 5),
    ],
  ),
];

int getMaxScore() {
  int maxScore = 0;

  for (var question in questions) {
    // Find the highest score among the answers for each question
    int maxAnswerScore = question.answers.map((answer) => answer.score).reduce((a, b) => a > b ? a : b);
    maxScore += maxAnswerScore; // Add the highest score for each question
  }

  return maxScore;
}