import 'package:svu_placement_test/models/question_model.dart';

class Quiz {
  String level;
  String skill;
  List<Question> questions;

  Quiz({
    required this.level,
    required this.skill,
    required this.questions,
  });
}
