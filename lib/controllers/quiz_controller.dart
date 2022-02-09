import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/constants.dart';
import 'package:svu_placement_test/models/question_model.dart';
import 'package:svu_placement_test/models/quiz_model.dart';
import 'package:svu_placement_test/views/result_screen.dart';
import 'package:svu_placement_test/views/welcome_screen.dart';

class QuizController extends GetxController {
  String name = '';
  String? level = '';
  String? skill = '';

  Quiz quiz = quizes[0];

  int get countOfQuestions => quiz.questions.length;

  //Check if the answer is pressed
  bool _isPressed = false;
  bool get isPressed => _isPressed;

  double _numberOfQuestion = 1;
  double get numberOfQuestion => _numberOfQuestion;

  int? _selectedAnswer;
  int? get selectedAnswer => _selectedAnswer;

  int? _correctAnswer;
  int _countOfCorrectAnswers = 0;
  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //Check if the question has been answered
  final Map<int, bool> _answerdQuestions = {};

  //page view controller
  late PageController pageController;

  //timer
  Timer? _timer;

  final maxSec = 15;

  final RxInt _sec = 15.obs;
  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswers();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  List<Quiz> getQuizesByLevelAndSkill(String? level, String? skill) {
    return quizes
        .where((element) =>
            (element.level == level && element.skill == skill) ? true : false)
        .toList();
  }

  double get scoreResult {
    return _countOfCorrectAnswers * 100 / quiz.questions.length;
  }

  void checkAnswer(Question question, int selectedAnswer) {
    _isPressed = true;

    _selectedAnswer = selectedAnswer;
    _correctAnswer = question.answer;

    if (_correctAnswer == _selectedAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _answerdQuestions.update(question.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
    update();
  }

  bool questionAnswer(int quesId) {
    return _answerdQuestions.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      stopTimer();
    }
    if (pageController.page == quiz.questions.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectedAnswer &&
          _correctAnswer != _selectedAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectedAnswer &&
          _correctAnswer != _selectedAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void resetTimer() => _sec.value = maxSec;

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void stopTimer() => _timer!.cancel();
  //call when start again quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswers();
    _selectedAnswer = null;
    Get.offAllNamed(WelcomeScreen.routeName);
  }

  void resetAnswers() {
    for (var question in quiz.questions) {
      _answerdQuestions.addAll({question.id: false});
    }
    update();
  }
}
