import 'package:get/get.dart';
import 'package:getx_template/modules/feature/home/controllers/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
