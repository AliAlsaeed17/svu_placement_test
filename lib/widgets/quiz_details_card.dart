import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/constants.dart';
import 'package:svu_placement_test/controllers/quiz_controller.dart';
import 'package:svu_placement_test/models/quiz_model.dart';
import 'package:svu_placement_test/views/quiz_screen.dart';

class QuizDetailsCard extends StatelessWidget {
  final Quiz quiz;

  const QuizDetailsCard({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: kPageContentPadding,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(quiz.title, style: kSubHeaderStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Author: " + quiz.author, style: kLabelTextStyle),
                    Text("Level: " + quiz.level, style: kLabelTextStyle),
                    Text("Skill: " + quiz.skill, style: kLabelTextStyle),
                  ],
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 12),
                  onPressed: () {
                    Get.find<QuizController>().quiz = quiz;
                    print(Get.find<QuizController>().quiz.questions);
                    Get.offAndToNamed(QuizScreen.routeName);
                    Get.find<QuizController>().startTimer();
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    size: 60,
                    color: Colors.lightGreen,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
