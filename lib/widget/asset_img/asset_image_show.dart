

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Asset_imge_show{
  SvgPicture SvgPicture_asset(String image_path,
      {double? height, double? width, Color? color_code}) {
    return SvgPicture.asset(
      image_path,
      height: height,
      width: width,
      color: color_code,
    );
  }

  Image Img_asset(String image_path,
      {double? height,
        double? width,
        Color? color_code,
        BoxFit? boxFit,
        BlendMode? blendMode}) {
    return Image.asset(
      image_path,
      height: height,
      width: width,
      color: color_code,
      colorBlendMode: blendMode,
      fit: boxFit,
    );
  }


}