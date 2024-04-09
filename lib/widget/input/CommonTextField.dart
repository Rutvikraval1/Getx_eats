import 'package:eats_app/utils/app_style.dart';
import 'package:eats_app/utils/custColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField {
  static Widget textField(
      {required TextEditingController? controller,
      String? hintText,
      String? show_91_no,
      String? TextInputType_number,
        final int? input_total_digit,
      String? text_enabled}) {
    return TextFormField(
      controller: controller,
      enabled: text_enabled == null ? true : false,
      maxLines: null,
      style: App_style().text_16_700_black,
        keyboardType: TextInputType_number != null ? TextInputType.number : null,
      inputFormatters: TextInputType_number != null
          ? <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        LengthLimitingTextInputFormatter(input_total_digit),
        FilteringTextInputFormatter.digitsOnly
      ]
          : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              width: 0.8,
              color: AppColors.ligth_grey
            // style: BorderStyle.,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0.8,
            color: AppColors.ligth_grey
            // style: BorderStyle.,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              width: 0.8,
              color: AppColors.ligth_grey
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              width: 0.8,
              color: AppColors.ligth_grey
          ),
        ),
        fillColor: const Color(0xffEDEDED),
        hintText: hintText,
        hintStyle: App_style().text_16_400_ligth_grey,
        prefixIconConstraints: BoxConstraints(minWidth: 70,),
        prefixIcon:show_91_no==null?null:Text(
         '+91',
          textAlign: TextAlign.center,
          style: App_style().text_16_700_black,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}



