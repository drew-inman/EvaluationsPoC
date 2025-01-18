import 'package:evaluations_poc/models/quiz_answer.dart';

class QuizQuestion {
    const QuizQuestion(this.text, this.answers);

    final String text;
    final List<QuizAnswer> answers;

  List<QuizAnswer> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}