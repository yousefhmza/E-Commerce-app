import 'package:ecommerce/helper/enums.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({Key? key}) : super(key: key);

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.standard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.0.h),
        RadioListTile<Delivery>(
          value: Delivery.standard,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery = value!;
            });
          },
          title: Text(
            "توصيل عادي",
            style: TextStyle(
              fontSize: 22.0.sp,
            ),
          ),
          subtitle: Text(
            "\nيصل الطلب في فترة من 3-5 أيام عمل",
            style: TextStyle(
              fontSize: 16.0.sp,
              color: Colors.grey,
            ),
          ),
          activeColor: primaryColor,
        ),
        SizedBox(height: 20.0.h),
        RadioListTile<Delivery>(
          value: Delivery.nextDay,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery = value!;
            });
          },
          title: CustomText(
            text: "توصيل في اليوم التالي",
            fontSize: 22.0.sp,
          ),
          subtitle: CustomText(
            text:
                "\nقم بالطلب قبل السادسة مساء و سيصلك الطلب في اليوم التالي",
            fontSize: 16.0.sp,
            color: Colors.grey,
          ),
          activeColor: primaryColor,
        ),
        SizedBox(height: 20.0.h),
        RadioListTile<Delivery>(
          value: Delivery.eliminated,
          groupValue: delivery,
          onChanged: (value) {
            setState(() {
              delivery = value!;
            });
          },
          title: CustomText(
            text: "توصيل اختياري",
            fontSize: 22.0.sp,
          ),
          subtitle: CustomText(
            text:
                "\nاختر تاريخ التوصيل بنفسك",
            fontSize: 16.0.sp,
            color: Colors.grey,
          ),
          activeColor: primaryColor,
        ),
      ],
    );
  }
}
