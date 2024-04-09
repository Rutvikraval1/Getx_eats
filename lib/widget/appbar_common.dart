

import 'package:flutter/material.dart';

import '../utils/app_locale.dart';
import '../utils/app_style.dart';
import 'asset_img/asset_image_show.dart';


PreferredSizeWidget appbarCommon({required String title_text, Function? leading_ontap,bool share_icon=false,Function? shareOnTap}) {
  return AppBar(
      title:Text(title_text),
      titleSpacing: 0,
      titleTextStyle: App_style().text_24_700_black,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leadingWidth: leading_ontap!=null?75:20,
      leading: leading_ontap!=null?InkWell(
          onTap: (){
            leading_ontap();
          },
          child: Asset_imge_show().Img_asset(AppImages.back_arrow)):const SizedBox(),
      iconTheme:  const IconThemeData(color: Colors.black),
      elevation: 0,
      actions: [
        if(share_icon)
          Padding(
        padding: const EdgeInsets.only(right: 20),
        child: InkWell(
            onTap: (){
              shareOnTap!();
            },
            child: Asset_imge_show().SvgPicture_asset(AppImages.share_icon)),
      ),

    ],
  );
}

PreferredSizeWidget MainAppBar() {
  return AppBar(
      titleSpacing: 0,
      titleTextStyle: App_style().text_24_700_black,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      leadingWidth:150,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Asset_imge_show().SvgPicture_asset(AppImages.app_logo),
      ),
      iconTheme:  const IconThemeData(color: Colors.black),
      actions: [
        Asset_imge_show().SvgPicture_asset(AppImages.scan_img),
        const SizedBox(width: 12,),
        Asset_imge_show().Img_asset(AppImages.profile_pic),
        const SizedBox(width: 20,),
      ],
      elevation: 5
  );
}
