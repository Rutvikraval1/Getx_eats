import 'package:eats_app/utils/app_style.dart';
import 'package:eats_app/widget/Scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homeController.dart';
import '../../utils/app_locale.dart';
import '../../widget/card/cusShop_card.dart';
import '../../widget/custom_slider_banner/custom_slider_banner.dart';
import 'cafe_details/cafe_details.dart';

class home_screen extends GetView<HomeController>{


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold_widget(
        body:  controller.obx((data) =>
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cus_size_box().sizedBox_10,
                  custom_slider_banner(
                      Networkimage: controller.Slider_list,
                      ontap: (value) {
                        print("ss");
                        print(value);
                      }),
                  ListView.builder(
                    itemCount: controller.cafe_name.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(index==0)
                                  Text(
                                    'Explore Nearby',
                                    style: App_style().text_16_700_darkBraound,
                                  ),
                                if(index==0)
                                  cus_size_box().sizedBox_15,
                                 CusShop_card(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => cafe_details(),));
                                   },
                                  title:controller.cafe_name[index],
                                  close_time: controller.closing_time[index],
                                  kilomiter: '2',
                                  shop_img: controller.logo_image_id[index],
                                  starting_price: controller.starting_price[index].toString(),
                                  shop_star:'${controller.avg_google_rating[index]}(${controller.google_rating_count[index]})',
                                )
                              ],
                            ),
                          ),
                        ),
                        cus_size_box().sizedBox_10,
                      ],
                    ),)
                ],
              ),
            )
        )
      );
  }

}
