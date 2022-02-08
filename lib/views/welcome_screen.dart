import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/constants.dart';
import 'package:svu_placement_test/controllers/quiz_controller.dart';
import 'package:svu_placement_test/views/quiz_screen.dart';
import 'package:svu_placement_test/widgets/custom_button.dart';
import 'package:svu_placement_test/widgets/custom_dropdownbutton.dart';
import 'package:svu_placement_test/widgets/custom_textfromfield.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _fullNameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    Get.offAndToNamed(QuizScreen.routeName);
    Get.find<QuizController>().startTimer();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: kBackgroundColor,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "SVU Plcement Test",
                    textAlign: TextAlign.center,
                    style: kAppTitleStyle,
                  ),
                ),
                Padding(
                  padding: kPageContentPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      const Text('Let\'s start', style: kSubHeaderStyle),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Form(
                        key: _formkey,
                        child: GetBuilder<QuizController>(
                          init: Get.find<QuizController>(),
                          builder: (controller) => Column(
                            children: [
                              CustomTextFromField(
                                label: "Full Name",
                                hintText: "Please enter your full name",
                                textEditingController: _fullNameController,
                                onSaved: (String? val) =>
                                    controller.name = val!.trim().toUpperCase(),
                                onFieldSubmitted: (_) => _submit(context),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              CustomDropdownButton(
                                label: "Level",
                                hintText: "Please select your level",
                                options: kLeveles,
                                onChanged: (String? value) {},
                                onSaved: (String? value) {},
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              CustomDropdownButton(
                                label: "Skill",
                                hintText: "Please select skill",
                                options: kSkills,
                                onChanged: (String? value) {},
                                onSaved: (String? value) {},
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          width: double.infinity,
                          onPressed: () => _submit(context),
                          text: 'Find Quizes',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
