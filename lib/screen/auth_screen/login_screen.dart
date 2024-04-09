
import 'package:get/get.dart';
import 'package:eats_app/screen/auth_screen/verify_otp_screen.dart';
import 'package:eats_app/widget/Scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/app_locale.dart';
import '../../utils/app_style.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/asset_img/asset_image_show.dart';
import '../../widget/button/cus_navigateBtn.dart';
import '../../widget/input/CommonTextField.dart';
import 'auth_controller/login_controller.dart';
import 'auth_provider/provider.dart';

class login_screen extends GetView<LoginController> {
  login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold_widget(
        body: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width / 2.7,
                    child: Asset_imge_show().SvgPicture_asset(AppImages.app_logo),
                  ),
                  cus_size_box().sizedBox_10,
                  Text(
                    Common_text.welcome,
                    style: App_style().text_24_700_black,
                  ),
                  CommonText_Title.textField_title(
                      text: 'Please enter your phone number to proceed'),
                  cus_size_box().sizedBox_50,
                  CommonText_Title.textField_title(
                      text: 'Enter 10 digit phone number'),
                  cus_size_box().sizedBox_5,
                  CommonTextField.textField(
                      controller: controller.phone_textController,
                      TextInputType_number: 'true',
                      input_total_digit: 10,
                      hintText: 'Enter phone number',
                      show_91_no: 'true')
                ],
              ),
            ),
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
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'By Clicking Continue, I agree ',
                    style: App_style().text_14_500_ligth_grey,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms & Condition',
                          style: App_style().text_12_600_black_underline),
                      TextSpan(
                          text: ' & ', style: App_style().text_14_500_ligth_grey),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: App_style().text_12_600_black_underline),
                      // can add more TextSpans here...
                    ],
                  ),
                ),
                cus_size_box().sizedBox_15,
                Row(
                  children: [
                    Expanded(
                        child: cus_navigateBtn(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.login_api();
                      },
                      text: 'Continue',
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }




}
