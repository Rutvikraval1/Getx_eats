
import 'package:eats_app/utils/app_style.dart';
import 'package:eats_app/utils/custColors.dart';
import 'package:flutter/material.dart';

class cus_navigateBtn extends StatefulWidget {
  final Function onPressed;
  final String text;
  const cus_navigateBtn({super.key,required this.onPressed, required this.text});

  @override
  State<cus_navigateBtn> createState() => _cus_navigateBtnState();
}

class _cus_navigateBtnState extends State<cus_navigateBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.topLeft,
        padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
        backgroundColor: MaterialStateProperty.all(AppColors.green),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style:  App_style().text_16_600_white,
            ),
            const Icon(Icons.arrow_forward,color: AppColors.whiteColor,)
          ],
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
