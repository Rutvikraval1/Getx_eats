
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eats_app/utils/app_locale.dart';
import 'package:flutter/material.dart';

class custom_slider_banner extends StatefulWidget {
  final Function ontap;
  final List Networkimage;

  const custom_slider_banner({super.key,required this.ontap,required this.Networkimage});

  @override
  State<custom_slider_banner> createState() => _custom_slider_bannerState();
}


class _custom_slider_bannerState extends State<custom_slider_banner> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  List dynamic_image=[
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
    'abced1c7-961d-4bd2-e5ab-ece57a2d3900',
  ];


  @override
  Widget build(BuildContext context) {
    return widget.Networkimage.isNotEmpty?Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3.8,
          child: CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount:widget.Networkimage.length,
            itemBuilder: (context, index, int) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage('https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
                fit: BoxFit.fill
              )
            ),
            ),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 1.8,
              onPageChanged: (index, reason) {
                setState(() {
                  widget.ontap(index);
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.Networkimage.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Color(0xffB9C9DC)
                        :Color(0xff00CF63))
                        .withOpacity(_current == entry.key ? 1 : 0.2)),
              ),
            );
          }).toList(),
        ),
      ],
    ):const SizedBox();
  }
}