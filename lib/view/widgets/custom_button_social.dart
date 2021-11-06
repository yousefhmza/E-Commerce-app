import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/view/widgets/custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final String imageName;

  const CustomButtonSocial({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      padding: EdgeInsets.all(16.0.h),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("assets/images/$imageName"),
          CustomText(
            text: text,
            fontSize: 14.0.sp,
            alignment: AlignmentDirectional.center,
          )
        ],
      ),
    );
  }
}
