import 'package:eats_app/screen/auth_screen/auth_controller/addProfile_coontroller.dart';
import 'package:eats_app/screen/auth_screen/auth_controller/login_controller.dart';
import 'package:get/get.dart';

import '../controller/homeController.dart';


class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AddProfileController());
    Get.lazyPut(() => HomeController());
  }
}

