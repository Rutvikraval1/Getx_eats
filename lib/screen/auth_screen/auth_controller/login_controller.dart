
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../binding/binding_pages.dart';
import '../../../utils/app_locale.dart';
import '../../../widget/Flutter_toast_mes.dart';
import '../../main_home_screen.dart';
import '../auth_provider/provider.dart';
import '../verify_otp_screen.dart';

class LoginController extends GetxController
    with StateMixin<dynamic> {
  TextEditingController phone_textController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> login_api() async {
    if(phone_textController.text==''){
      return Flutter_toast_mes().Error_Message(Tost_meassage.plsPhoneNumber,error_code: true);
    }if(phone_textController.text.toString().length!=10){
      return Flutter_toast_mes().Error_Message(Tost_meassage.plsValidNumber,error_code: true);
    }else{
      var login_data= await Auth_provider().getLoginDetails(phone_number:phone_textController.text,countrycode: '91');
      if(login_data!=null){
        print("login_data");
        print(login_data);
        if(login_data['success']){
          print("new_user check");
          print( login_data['data']['new_user']);
          Flutter_toast_mes().Error_Message(login_data['msg']);
          Get.to(Verify_otp_screen(
            countrycode: '91',
            phone_number: phone_textController.text,
            new_user_check: login_data['data']['new_user'],
          ),binding: DataBinding());
        }else{
          Flutter_toast_mes().Error_Message(login_data['msg'],error_code: true);
        }
      }else{
        Flutter_toast_mes().Error_Message(Tost_meassage.tryAgain,error_code: true);
      }
    }
  }
}