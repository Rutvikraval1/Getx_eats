
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_locale.dart';
import '../../../widget/Flutter_toast_mes.dart';
import '../../main_home_screen.dart';
import '../auth_provider/provider.dart';

class AddProfileController extends GetxController
    with StateMixin<dynamic> {

  TextEditingController Fname_controller = TextEditingController();
  TextEditingController Lname_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  var dropdownValue;
  var seleted_gender="Male";
  List city_list=[
    'Surat',
    'Vapi',
    'Navrasi'
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void updateCiy(var value){
    dropdownValue = value;
    update();
  }
  void handleGenderChange(var value) {
    seleted_gender = value;
    update();
  }

  Future<void> add_profileData_api() async {
    var data= await Auth_provider().add_profile(
      email: email_controller.text,
      gender:seleted_gender ,
      city_name: dropdownValue.toString(),
      firstName: Fname_controller.text,
      lastName:Lname_controller.text ,
    );
    if(data!=null){
      print("data");
      print(data);
      if(data['status']){
        Flutter_toast_mes().Error_Message(data['msg']);
        Get.replace(main_home_screen());
      }else{
        Flutter_toast_mes().Error_Message(data['msg'],error_code: true);
      }
    }else{
      Flutter_toast_mes().Error_Message(Tost_meassage.tryAgain,error_code: true);
    }
  }
}