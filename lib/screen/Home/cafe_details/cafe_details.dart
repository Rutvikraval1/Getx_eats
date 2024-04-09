import 'package:eats_app/widget/Scaffold_widget.dart';
import 'package:flutter/material.dart';

import '../../../widget/appbar_common.dart';
import '../../../widget/custom_slider_banner/custom_slider_banner.dart';

class cafe_details extends StatefulWidget {
  const cafe_details({super.key});

  @override
  State<cafe_details> createState() => _cafe_detailsState();
}

class _cafe_detailsState extends State<cafe_details> {
  List dynamic_image=[
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold_widget(
        appBar: appbarCommon(
            title_text: 'Cafe Name',
            leading_ontap: () {
              Navigator.pop(context);
            },
            share_icon: true,
            shareOnTap: () {}),
        body: Column(
          children: [
            custom_slider_banner(
                Networkimage:dynamic_image,
                ontap: (value) {
                  print("ss");
                  print(value);
                }),




          ],
        ));
  }
}
