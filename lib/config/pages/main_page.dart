import 'package:get/route_manager.dart';
import 'package:getx_template/config/routes/main_route.dart';
import 'package:getx_template/modules/feature/home/bindings/home_bindings.dart';
import 'package:getx_template/modules/feature/home/views/ui/home_view.dart';

abstract class MainPage {
  static final main = [
    GetPage(
      name: MainRoute.home,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
  ];
}
