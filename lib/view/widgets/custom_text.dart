import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final AlignmentDirectional alignment;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? height;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    required this.fontSize,
    this.alignment = AlignmentDirectional.topStart,
    this.fontWeight = FontWeight.normal,
    this.height,
    this.maxLines,
    this.textOverflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height
        ),
        maxLines: maxLines,
        overflow: textOverflow,
      ),
    );
  }
}
