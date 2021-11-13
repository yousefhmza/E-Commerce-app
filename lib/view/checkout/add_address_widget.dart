import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/view_model/checkout_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  AddAddress({Key? key}) : super(key: key);

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutViewModel>(builder: (controller) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Billing address is the same as delivery address",
                    fontSize: 16.0.sp,
                  ),
                  SizedBox(height: 30.0.h),
                  CustomTextFormField(
                    text: "Street 1",
                    hintText: "21, Alex Davidson Avenue",
                    onSaved: (value) {
                      controller.street1 = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Street Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  CustomTextFormField(
                    text: "Street 2",
                    hintText: "Opposite Omegatron, Vicent Quarters",
                    onSaved: (value) {
                      controller.street2 = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Street Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  CustomTextFormField(
                    text: "City",
                    hintText: "Victoria Island",
                    onSaved: (value) {
                      controller.city = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your City";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30.0.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          text: "State",
                          hintText: "Lagos",
                          onSaved: (value) {
                            controller.state = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your State";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 10.0.w),
                      Expanded(
                        child: CustomTextFormField(
                          text: "Country",
                          hintText: "Nigeria",
                          onSaved: (value) {
                            controller.country = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Country";
                            } else {
                              return null;
                            }
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
