
// ignore_for_file: use_build_context_synchronously

import 'package:eats_app/utils/custColors.dart';
import 'package:eats_app/widget/Scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../binding/binding_pages.dart';
import '../../service/pref_manager.dart';
import '../../utils/app_locale.dart';
import '../../utils/app_style.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/appbar_common.dart';
import '../../widget/asset_img/asset_image_show.dart';
import '../../widget/button/cus_navigateBtn.dart';
import '../main_home_screen.dart';
import 'add_infomation.dart';
import 'auth_provider/provider.dart';

class Verify_otp_screen extends StatefulWidget {
  final String phone_number;
  final String countrycode;
  final bool new_user_check;
  const Verify_otp_screen({super.key,required this.phone_number,required this.countrycode,required this.new_user_check});

  @override
  State<Verify_otp_screen> createState() => _Verify_otp_screenState();
}

class _Verify_otp_screenState extends State<Verify_otp_screen> {
  String smscode_check = '';


  @override
  void initState() {
    Preferences.init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold_widget(
      appBar: appbarCommon(title_text: 'Verify Account',leading_ontap: (){Navigator.pop(context);}),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          CommonText_Title.textField_title(
              text: 'OTP sent to +${widget.countrycode}-${widget.phone_number}. Enter OTP'),
                  SizedBox(height: height/6,),
                  OtpTextField(
                    numberOfFields: 6,
                    fieldWidth: width/7.5,
                    borderRadius: BorderRadius.circular(8),
                    focusedBorderColor: AppColors.green,
                    textStyle: App_style().text_16_600_dark_grey,
                    showFieldAsBox: true,
                    filled: true,
                    onCodeChanged: (String code) {
                      smscode_check = code;
                    },
                    onSubmit: (String verificationCode){
                      smscode_check = verificationCode;
                    }, // end onSubmit
                  ),

                ],
              ),
        ),
        bottomNavigationBar: Container(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            elevation: 0,
            height: height / 5.9,
            padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            color: Colors.transparent,
            child: Column(
              children: [
                Text('Resend OTP',style: App_style().text_16_600_black_underline),
                cus_size_box().sizedBox_10,
                Row(
                  children: [
                    Expanded(
                        child: cus_navigateBtn(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            OTP_Verify_api();
                          },
                          text: 'Verify and Proceed',
                        )),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  Future<void> OTP_Verify_api() async {
    if(smscode_check==''){
      return Flutter_toast_mes().Error_Message(Tost_meassage.plsenter_OTP,error_code: true);
    }if(smscode_check.toString().length!=6){
      return Flutter_toast_mes().Error_Message(Tost_meassage.pls6digitOtp,error_code: true);
    }else{
      var verify_data= await Auth_provider().getOTP_Verify(phone_number: widget.phone_number,countrycode: widget.countrycode,otp: smscode_check);
      if(verify_data!=null){
        print("verify_data");
        print(verify_data);
        if(verify_data['status']){
          Preferences.addDataToSF(Preferences.user_active, true);
          Preferences.addDataToSF(Preferences.user_id, verify_data['userId']);
          Preferences.addDataToSF(Preferences.user_token,verify_data['Token']);
          if(widget.new_user_check){
            Get.to(add_information(),binding: DataBinding());
          }else{
            Get.offAll(main_home_screen());
          }

        }else{
          Flutter_toast_mes().Error_Message(verify_data['msg'],error_code: true);
        }
      }else{
        Flutter_toast_mes().Error_Message(Tost_meassage.tryAgain,error_code: true);
      }
    }


  }
}
