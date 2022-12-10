import 'package:get/get.dart';
import 'package:movie_it/controller/movie_controller.dart';
import 'package:movie_it/controller/screen_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ScreenController());
    Get.put(MovieController());
  }
}
