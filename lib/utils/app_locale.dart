
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_style.dart';
import 'custColors.dart';

class AppImages {
  static const String app_logo = 'assets/svg/app_logo.svg';
  static const String back_arrow = 'assets/png/back_arrow.png';
  static const String scan_img = 'assets/svg/scan_img.svg';
  static const String profile_pic = 'assets/svg/profile_pic.png';
  static const String tredmakar_green = 'assets/svg/marker_green.svg';
  static const String tredmakar_red = 'assets/svg/marker_red.svg';
  static const String no_image = 'assets/png/no_image.png';
  static const String share_icon = 'assets/svg/share_icon.svg';
  static const String mini_qrcode = 'assets/svg/mini_qrcode.svg';
  static const String mini_Applogo = 'assets/svg/mini_Applogo.svg';

}

class Cus_funcation{

  String network_Imgpath({String Img_id='',String Img_size='540x540'}){
    return 'https://imagedelivery.net/ZbREGku6Wb-je932q-T-KA/$Img_id/eats$Img_size';
  }


  String convertTime(String time24) {
    if(time24==''){
      return '';
    }
    final dateFormat = DateFormat('HH:mm:ss');
    final DateTime dateTime = dateFormat.parse(time24);
    final timeFormat = DateFormat('h:mm a');
    return timeFormat.format(dateTime);
  }
}




class Common_text{
  static const String welcome='Welcome!';

}


class Tost_meassage{
  static const String connectInternet='Please connect internet!';
  static const String server_error='Server error';
  static const String pageNotFound='Page not found';
  static const String tryAgain='Please try again';
  static const String plsPhoneNumber='Please enter phone number';
  static const String plsValidNumber='Please enter valid number';
  static const String pls6digitOtp='Please enter 6 digit otp';
  static const String plsenter_OTP='Please enter OTP';
  static const String plsenter='Please enter';
  static const String plsselect='Please select';

}

class cus_size_box{
  SizedBox sizedBox_3= const SizedBox(height: 3);
  SizedBox sizedBox_5= const SizedBox(height: 5);
  SizedBox sizedBox_8= const SizedBox(height: 8);
  SizedBox sizedBox_10= const SizedBox(height: 10);
  SizedBox sizedBox_15= const SizedBox(height: 15);
  SizedBox sizedBox_20= const SizedBox(height: 20);
  SizedBox sizedBox_30= const SizedBox(height: 30);
  SizedBox sizedBox_50= const SizedBox(height: 50);
}


class CommonText_Title {
  static Widget textField_title({
    required String text,
  }) =>
      Text(text,
          style: App_style().text_14_500_ligth_grey);


  static Widget title_widget({
    required String text,
    String? sub_text,
  }) =>
      Row(
        children: [
          Text(text,
              style: App_style().text_14_500_ligth_grey),
          if(sub_text!=null)
            Text(sub_text,
                style: App_style().text_14_500_red),
        ],
      );


}
