
import 'package:eats_app/widget/Scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/app_locale.dart';
import '../../utils/app_style.dart';
import '../../utils/custColors.dart';
import '../../widget/Flutter_toast_mes.dart';
import '../../widget/appbar_common.dart';
import '../../widget/button/cus_navigateBtn.dart';
import '../../widget/input/CommonTextField.dart';
import '../main_home_screen.dart';
import 'auth_controller/addProfile_coontroller.dart';
import 'auth_provider/provider.dart';
import 'package:get/get.dart';


class add_information extends GetView<AddProfileController> {
   add_information({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold_widget(
        appBar: appbarCommon(title_text: 'Add Information'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText_Title.textField_title(
                    text: 'Please add your information so we can provide you better experience.'),
                cus_size_box().sizedBox_30,
                CommonText_Title.title_widget(text: 'First Name',sub_text: " *"),
                cus_size_box().sizedBox_5,
                CommonTextField.textField(
                    controller: controller.Fname_controller,
                    hintText: 'Enter your first name here'),
                cus_size_box().sizedBox_20,
                CommonText_Title.title_widget(text: 'Last Name',sub_text: " *"),
                cus_size_box().sizedBox_5,
                CommonTextField.textField(
                    controller: controller.Lname_controller,
                    hintText: 'Enter your last name here'),
                cus_size_box().sizedBox_20,
                CommonText_Title.title_widget(text: 'Email Address',sub_text: " *"),
                cus_size_box().sizedBox_5,
                CommonTextField.textField(
                    controller: controller.email_controller,
                    hintText: 'Enter your email here'),
                cus_size_box().sizedBox_20,
                CommonText_Title.title_widget(text: 'City',sub_text: " *"),
                cus_size_box().sizedBox_5,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.ligth_grey,
                      width: 0.8
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: controller.dropdownValue,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconSize: 20,
                      isExpanded: true,
                      style: App_style().text_16_700_black,
                      hint:  Text('Enter your city here',
                          style: App_style().text_16_400_ligth_grey),
                      onChanged: (newValue) {
                        controller.updateCiy(newValue);
                      },
                      items: controller.city_list.map<DropdownMenuItem>((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                cus_size_box().sizedBox_20,
                CommonText_Title.title_widget(text: 'Gender',sub_text: " *"),
                cus_size_box().sizedBox_5,
                Row(
                  children: [
                    Common_radio_widget(value: "Female"),
                    SizedBox(width: 10,),
                    Common_radio_widget(value: "Male"),
                    SizedBox(width: 10,),
                    Common_radio_widget(value: "Other"),
                    SizedBox(width: 10,),
                  ],
                )
                ],),
          ),
        ),
        bottomNavigationBar: Container(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomAppBar(
            elevation: 0,
            padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
            color: Colors.transparent,
            child:  Row(
              children: [
                Expanded(
                    child: cus_navigateBtn(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if(controller.Fname_controller.text==''){
                          return Flutter_toast_mes().Error_Message('${Tost_meassage.plsselect} first name',error_code: true);
                        }else if(controller.Lname_controller.text==''){
                          return Flutter_toast_mes().Error_Message('${Tost_meassage.plsselect} last name',error_code: true);
                        }else if(controller.email_controller.text==''){
                          return Flutter_toast_mes().Error_Message('${Tost_meassage.plsselect} email',error_code: true);
                        }else if(controller.dropdownValue==null){
                          return Flutter_toast_mes().Error_Message('${Tost_meassage.plsselect} city',error_code: true);
                        }else if(controller.seleted_gender==''){
                          return Flutter_toast_mes().Error_Message('${Tost_meassage.plsselect} gender',error_code: true);
                        }else{
                          controller.add_profileData_api();
                        }

                      },
                      text: 'Continue',
                    )),
              ],
            ),
          ),
        )
    );
  }



  Widget Common_radio_widget({String value='',}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio<String>(
          value: value,
          groupValue: controller.seleted_gender,
          activeColor: AppColors.green,
          onChanged: controller.handleGenderChange,
        ),
        Text(value,style: App_style().text_14_500_ligth_grey,),
      ],
    );
  }
}
