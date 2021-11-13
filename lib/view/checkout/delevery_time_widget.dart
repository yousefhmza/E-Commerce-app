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
    return Expanded(
      child: Column(
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
            title: CustomText(
              text: "Standard Delivery",
              fontSize: 22.0.sp,
            ),
            subtitle: CustomText(
              text: "\nOrder will be delivered between 3 - 5 business days",
              fontSize: 16.0.sp,
              color: Colors.grey,
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
              text: "Next Day Delivery",
              fontSize: 22.0.sp,
            ),
            subtitle: CustomText(
              text:
                  "\nPlace your order before 6pm and your items will be delivered the next day",
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
              });            },
            title: CustomText(
              text: "Nominated Delivery",
              fontSize: 22.0.sp,
            ),
            subtitle: CustomText(
              text:
                  "\nPick a particular date from the calendar and order will be delivered on selected date",
              fontSize: 16.0.sp,
              color: Colors.grey,
            ),
            activeColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
