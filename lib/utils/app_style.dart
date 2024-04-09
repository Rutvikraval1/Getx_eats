
import 'package:flutter/material.dart';

import 'custColors.dart';

class App_style{

  TextStyle text_24_700_black = const TextStyle(
    color: AppColors.black,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  TextStyle text_16_700_black = const TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  TextStyle text_16_400_ligth_grey = const TextStyle(
    color: AppColors.ligth_grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  TextStyle text_14_500_ligth_grey = const TextStyle(
    color: AppColors.ligth_grey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  TextStyle text_14_500_red = const TextStyle(
    color: AppColors.red,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  TextStyle text_12_600_black_underline = const TextStyle(
    color: AppColors.black,
    decoration: TextDecoration.underline,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  TextStyle text_16_600_black_underline = const TextStyle(
    color: AppColors.ligth_grey,
    decoration: TextDecoration.underline,
    fontSize: 16,
    decorationColor: AppColors.ligth_grey,
    fontWeight: FontWeight.w600,
  );

  TextStyle text_16_600_white = const TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  TextStyle text_16_600_dark_grey = const TextStyle(color: Color(0xff01A879),fontSize: 16,fontWeight: FontWeight.w600);

  TextStyle text_16_700_darkBraound = const  TextStyle(
  color: Color(0xFF004A00),
  fontSize: 16,
  fontWeight: FontWeight.w700,
  );
}