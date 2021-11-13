import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      padding: EdgeInsets.all(16.0.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      color: primaryColor,
      child: CustomText(
        text: text,
        fontSize: 14.0.sp,
        color: Colors.white,
        alignment: AlignmentDirectional.center,
      ),
    );
  }
}
