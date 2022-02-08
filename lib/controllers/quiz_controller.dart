import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/models/question_model.dart';
import 'package:svu_placement_test/views/result.dart';
import 'package:svu_placement_test/views/welcome_screen.dart';

class QuizController extends GetxController {
  String name = '';

  //Questions
  final List<Question> _questionsList = [
    Question(
      id: 1,
      question:
          "I wanted to make a cup of coffee, but I was pissed off. We had _____ coffee. ",
      answer: 2,
      options: ['a few', 'few', 'a little', 'little'],
    ),
    Question(
      id: 2,
      question: "I have too _____ time for my family. I am always busy.",
      answer: 1,
      options: ['a few', 'few', 'a little', 'little'],
    ),
    Question(
      id: 3,
      question:
          "Very _____ people came to his party. He was really angry and disappointed.",
      answer: 2,
      options: ['a few', 'few', 'little', 'a little'],
    ),
    Question(
      id: 4,
      question:
          "Although I am busy all the time, I always try to find _____ time for my kids",
      answer: 1,
      options: ['a few', 'few', 'a little', 'litle'],
    ),
    Question(
      id: 5,
      question:
          "I am still new to this city, but I am really glad I made _____ friends.",
      answer: 3,
      options: ['a few', 'few', 'a little', 'little'],
    ),
    Question(
      id: 6,
      question: "A new tax that is thought _____ protests _____ soon.",
      answer: 2,
      options: [
        'to cause / will be introduced',
        'to have caused / have been introduced',
        'to be causing / is introduced',
        'to have caused / are introduced'
      ],
    ),
    Question(
      id: 7,
      question: "Your proposals deserve _____ in detail.",
      answer: 3,
      options: [
        'to consider',
        'considered',
        'to be considered',
        'to be considering'
      ],
    ),
    Question(
      id: 8,
      question: "hello",
      answer: 3,
      options: ['hello', 'hi', 'hola', 'Suiiiiiiiiiiii'],
    ),
    Question(
      id: 9,
      question:
          "_____ wants to expose _____. People often hide their feelings. ",
      answer: 2,
      options: [
        'everybody / themselves',
        'anyone / himself',
        'nobody / themselves',
        'somebody / himself'
      ],
    ),
    Question(
      id: 10,
      question:
          "Strawberries are _____ cheap at the moment _____ we should make some jam.",
      answer: 1,
      options: ['more / than', 'not only / but also', 'so / that', 'both /and'],
    ),
  ];
  List<Question> get questionsList => [..._questionsList];
  int get countOfQuestions => _questionsList.length;

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

  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
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
    if (pageController.page == _questionsList.length - 1) {
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
    for (var question in _questionsList) {
      _answerdQuestions.addAll({question.id: false});
    }
    update();
  }
}
