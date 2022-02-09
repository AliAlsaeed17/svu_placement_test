import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/constants.dart';
import 'package:svu_placement_test/controllers/quiz_controller.dart';
import 'package:svu_placement_test/widgets/quiz_details_card.dart';

class AvailableQuizesScreen extends StatelessWidget {
  const AvailableQuizesScreen({Key? key}) : super(key: key);

  static const routeName = '/available_quizes_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: const BoxDecoration(color: kBackgroundColor),
          child: GetBuilder<QuizController>(
            init: Get.find<QuizController>(),
            builder: (controller) {
              var quizList = controller.getQuizesByLevelAndSkill(
                  controller.level, controller.skill);
              return ListView.builder(
                itemCount: quizList.length,
                itemBuilder: (context, index) {
                  return QuizDetailsCard(quiz: quizList[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
