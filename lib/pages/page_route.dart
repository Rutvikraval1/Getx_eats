

import 'package:eats_app/screen/auth_screen/login_screen.dart';
import 'package:get/get.dart';
import '../binding/binding_pages.dart';
import '../screen/splash/splash_screen.dart';
import 'page_route_name.dart';


class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: route_splash,
        page: () => const splash_screen(),
        binding: DataBinding()),
  ];
}
