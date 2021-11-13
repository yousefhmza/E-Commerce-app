import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/core/view_model/checkout_view_model.dart';
import 'package:ecommerce/helper/enums.dart';
import 'package:ecommerce/view/checkout/add_address_widget.dart';
import 'package:ecommerce/view/checkout/delevery_time_widget.dart';
import 'package:ecommerce/view/checkout/summary_widget.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(
      init: Get.put(CheckoutViewModel()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              text: "CheckOut",
              fontSize: 18.0.sp,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 75.0.h,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(primary: primaryColor),
                    ),
                    child: Stepper(
                      currentStep: controller.index,
                      elevation: 0.0,
                      steps: [
                        Step(
                          title: CustomText(
                            text: "Delivery",
                            fontSize: 16.0.sp,
                          ),
                          content: Container(),
                          isActive: controller.index == 0,
                          state: controller.index > 0
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: CustomText(
                            text: "Address",
                            fontSize: 16.0.sp,
                          ),
                          content: Container(),
                          isActive: controller.index == 1,
                          state: controller.index > 1
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                        Step(
                          title: CustomText(
                            text: "Summary",
                            fontSize: 16.0.sp,
                          ),
                          content: Container(),
                          isActive: controller.index == 2,
                          state: controller.index > 2
                              ? StepState.complete
                              : StepState.indexed,
                        ),
                      ],
                      type: StepperType.horizontal,
                    ),
                  ),
                ),
                controller.pages == Pages.deliveryTime
                    ? DeliveryTime()
                    : controller.pages == Pages.addAddress
                        ? AddAddress()
                        : Summary()
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.skip_next),
            onPressed: () {
              controller.setIndex(controller.index + 1);
            },
            backgroundColor: primaryColor,
          ),
        );
      },
    );
  }
}
