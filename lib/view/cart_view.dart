import 'package:ecommerce/view/checkout/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.put(CartViewModel()),
        builder: (controller) {
          return Scaffold(
            body: controller.cartProductsList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/empty cart.svg",
                        width: 200.0.w,
                        height: 200.0.h,
                      ),
                      SizedBox(height: 20.0.h),
                      CustomText(
                        text: "Empty Cart",
                        fontSize: 20.0.sp,
                        alignment: AlignmentDirectional.center,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                          child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.0.w,
                            right: 16.0.w,
                            top: 16.0.w,
                          ),
                          child: ListView.separated(
                            itemBuilder: (context, index) => SizedBox(
                              height: 140.0.h,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 140.0.h,
                                    child: Image.network(
                                      controller.cartProductsList[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 16.0.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller
                                            .cartProductsList[index].name,
                                        fontSize: 20.0.sp,
                                      ),
                                      SizedBox(height: 10.0.sp),
                                      CustomText(
                                        text:
                                            "\$ ${controller.cartProductsList[index].price.toString()}",
                                        fontSize: 16.0.sp,
                                        color: primaryColor,
                                        alignment: AlignmentDirectional.center,
                                      ),
                                      SizedBox(height: 10.0.sp),
                                      Container(
                                        padding: EdgeInsets.all(4.0.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0.r),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 24.0.sp,
                                              ),
                                              onTap: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                            ),
                                            SizedBox(width: 12.0.w),
                                            CustomText(
                                              text:
                                                  "${controller.cartProductsList[index].quantity}",
                                              fontSize: 16.0.sp,
                                            ),
                                            SizedBox(width: 12.0.w),
                                            GestureDetector(
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: 16.0.h),
                                                child: Icon(
                                                  Icons.minimize,
                                                  color: Colors.black,
                                                  size: 24.0.sp,
                                                ),
                                              ),
                                              onTap: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16.0.h),
                            itemCount: controller.cartProductsList.length,
                          ),
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "TOTAl",
                                  fontSize: 16.0.sp,
                                  color: Colors.grey,
                                ),
                                GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) {
                                      return CustomText(
                                        text: "\$ ${controller.totalPrice}",
                                        fontSize: 20.0.sp,
                                        color: primaryColor,
                                      );
                                    })
                              ],
                            ),
                            const Spacer(),
                            CustomButton(
                              text: "CheckOut",
                              onPressed: () {
                                Get.to(() => CheckoutView());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
