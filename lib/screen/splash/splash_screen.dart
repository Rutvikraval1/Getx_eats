
import 'dart:async';

import 'package:eats_app/screen/main_home_screen.dart';
import 'package:eats_app/utils/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../binding/binding_pages.dart';
import '../../service/pref_manager.dart';
import '../../widget/Scaffold_widget.dart';
import '../../widget/asset_img/asset_image_show.dart';
import '../auth_screen/login_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {


  @override
  void initState() {
    Preferences.init();
    startTimer();
    super.initState();
  }
  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    if (Preferences.getBoolValuesSF(Preferences.user_active)==null) {
      Get.to(() => login_screen(),binding: DataBinding());
    }else{
      Get.to(() => const main_home_screen(),binding: DataBinding());

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
      body: Center(
        child: Asset_imge_show().SvgPicture_asset(AppImages.app_logo),
      ),
    );
  }
}
