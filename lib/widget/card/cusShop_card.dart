import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../utils/app_locale.dart';
import '../asset_img/asset_image_show.dart';

class CusShop_card extends StatelessWidget {
  final String title;
  final String shop_img;
  final String close_time;
  final String starting_price;
  final String kilomiter;
  final String shop_star;
  final Function onTap;
  const CusShop_card(
      {super.key,
      required this.title,
      required this.shop_img,
      required this.close_time,
      required this.shop_star,
      required this.starting_price,
      required this.onTap,
      required this.kilomiter});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Bounceable(
          onTap: () {onTap();},
          child: Stack(
            children: [
              Container(
                height: height / 4,
                decoration: ShapeDecoration(
                  image:shop_img!=''? DecorationImage(
                    image:NetworkImage(Cus_funcation().network_Imgpath(Img_id:shop_img)),
                    fit: BoxFit.cover,
                  ):const DecorationImage(
                    image:AssetImage(AppImages.no_image),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              Positioned(
                  bottom: 4,
                  right: 8,
                  child: Row(
                children: [
                  Asset_imge_show().SvgPicture_asset('assets/svg/primim_card.svg',height: 28),
                  const SizedBox(width: 10,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0EB000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    ),
                    child:  Row(
                      children: [
                        const Icon(Icons.star,color: Color(0xffFFA527),size: 18,),
                        const SizedBox(width: 5,),
                        Text(shop_star, style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),)
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        cus_size_box().sizedBox_15,
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF0B0B0B),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Asset_imge_show().SvgPicture_asset(AppImages.tredmakar_green),
                const SizedBox(
                  width: 5,
                ),
                Asset_imge_show().SvgPicture_asset(AppImages.tredmakar_red)
              ],
            )
          ],
        ),
        cus_size_box().sizedBox_8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Closes ${Cus_funcation().convertTime(close_time)}',
              style: const TextStyle(
                color: Color(0xFFB6B7B9),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  'Starting at ₹$starting_price',
                  style: const TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFB6B7BA),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${kilomiter}km',
                  style: const TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
