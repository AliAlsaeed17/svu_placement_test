import 'package:svu_placement_test/models/question_model.dart';

class Quiz {
  String title;
  String author;
  String level;
  String skill;
  int durationForQuestion;
  List<Question> questions;

  Quiz({
    required this.title,
    required this.author,
    required this.level,
    required this.skill,
    required this.durationForQuestion,
    required this.questions,
  });
}
