import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextFormField({
    Key? key,
    required this.text,
    required this.hintText,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14.0.sp,
          color: Colors.grey.shade700,
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
