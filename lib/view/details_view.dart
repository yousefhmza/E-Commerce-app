import 'package:ecommerce/core/view_model/cart_view_model.dart';
import 'package:ecommerce/core/view_model/details_view_model.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce/model/products_model.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel productModel;

  DetailsView(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GetBuilder<DetailsViewModel>(
      init: Get.find<DetailsViewModel>(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 250.0.h,
                  child: Image.network(
                    productModel.image,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 15.0.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16.0.w),
                      child: Column(
                        children: [
                          CustomText(
                            text: productModel.name,
                            fontSize: 22.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 15.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.0.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                width: deviceWidth * 0.45,
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "الحجم",
                                      fontSize: 16.0.sp,
                                    ),
                                    const Spacer(),
                                    CustomText(
                                      text: productModel.size,
                                      fontSize: 16.0.sp,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0.r),
                                  border: Border.all(color: Colors.grey),
                                ),
                                width: deviceWidth * 0.45,
                                child: Row(
                                  children: [
                                    CustomText(
                                      text: "اللون",
                                      fontSize: 16.0.sp,
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 40.0.w,
                                      height: 20.0.h,
                                      decoration: BoxDecoration(
                                          color: productModel.color,
                                          borderRadius:
                                              BorderRadius.circular(10.0.r),
                                          border: Border.all(color: Colors.grey)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0.h),
                          CustomText(
                            text: "معلومات عن المنتج",
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 15.0.h),
                          CustomText(
                            text: productModel.description,
                            fontSize: 18.0.sp,
                            height: 1.5.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0.w),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "السعر",
                            fontSize: 18.0.sp,
                            color: Colors.grey,
                          ),
                          CustomText(
                            text: "${productModel.price} ج.م ",
                            fontSize: 22.0.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GetBuilder<CartViewModel>(
                          init: Get.put(CartViewModel()),
                          builder: (controller) {
                            return CustomButton(
                              text: "إضافة إلي العربة",
                              onPressed: () {
                                controller.addProduct(
                                  CartProductModel(
                                    productID: productModel.productID,
                                    name: productModel.name,
                                    image: productModel.image,
                                    price: productModel.price,
                                    quantity: 1,
                                  ),
                                );
                              },
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
