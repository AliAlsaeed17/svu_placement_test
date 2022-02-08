import 'package:get/get.dart';
import 'package:svu_placement_test/controllers/quiz_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
  }
}
