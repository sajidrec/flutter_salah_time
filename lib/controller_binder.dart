import 'package:get/get.dart';
import 'package:salah_time/presentation/controllers/home_screen_controller.dart';
import 'package:salah_time/presentation/controllers/search_history_screen_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(SearchHistoryScreenController());
  }
}
