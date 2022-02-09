import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svu_placement_test/utils/bindings.dart';
import 'package:svu_placement_test/views/available_quizes_screen.dart';
import 'package:svu_placement_test/views/quiz_screen.dart';
import 'package:svu_placement_test/views/result_screen.dart';
import 'package:svu_placement_test/views/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      title: 'SVU Placement Test',
      home: const WelcomeScreen(),
      getPages: [
        GetPage(
            name: WelcomeScreen.routeName, page: () => const WelcomeScreen()),
        GetPage(
            name: AvailableQuizesScreen.routeName,
            page: () => const AvailableQuizesScreen()),
        GetPage(name: QuizScreen.routeName, page: () => const QuizScreen()),
        GetPage(name: ResultScreen.routeName, page: () => const ResultScreen()),
      ],
    );
  }
}
