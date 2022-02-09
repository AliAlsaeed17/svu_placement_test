import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/constants.dart';
import 'package:svu_placement_test/controllers/quiz_controller.dart';
import 'package:svu_placement_test/models/question_model.dart';

import 'answer_option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.question,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
              const Spacer(
                flex: 1,
              ),
              ...List.generate(
                question.options.length,
                (index) => Column(
                  children: [
                    AnswerOption(
                      questionId: question.id,
                      text: question.options[index],
                      index: index,
                      onPressed: () => Get.find<QuizController>()
                          .checkAnswer(question, index),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ));
  }
}
