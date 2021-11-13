import 'package:ecommerce/view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/view_model/home_view_model.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: (controller) {
        return Scaffold(
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: 50.0.h,
                    right: 20.0.w,
                    left: 20.0.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SearchTextFormField(),
                        SizedBox(height: 30.0.h),
                        CustomText(
                          text: "Categories",
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 20.0.h),
                        const CategoryListView(),
                        SizedBox(height: 30.0.h),
                        Row(
                          children: [
                            CustomText(
                              text: "Best Selling",
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            const Spacer(),
                            CustomText(
                              text: "See All",
                              fontSize: 16.0.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0.h),
                        const ProductsListView(),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0.r),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) {
        return controller.isLoading.value
            ? const CircularProgressIndicator()
            : SizedBox(
                height: 100.0.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categModel!.categories.length,
                  separatorBuilder: (context, index) => SizedBox(width: 16.0.w),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60.0.h,
                          width: 100.0.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20.0.r),
                          ),
                          child: Image.network(
                              controller.categModel!.categories[index].image),
                        ),
                        SizedBox(height: 15.0.h),
                        CustomText(
                          text: controller.categModel!.categories[index].name,
                          fontSize: 12.0.sp,
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }
}

class ProductsListView extends StatelessWidget {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        //init: HomeViewModel(),
        builder: (controller) {
          return SizedBox(
            height: 350.0.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.prodModel!.products.length,
              separatorBuilder: (context, index) => SizedBox(width: 16.0.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() =>
                        DetailsView(controller.prodModel!.products[index]));
                  },
                  child: SizedBox(
                    width: 165.0.w,
                    child: Column(
                      children: [
                        Container(
                          width: 165.0.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0.r),
                                child: Image.network(
                                  controller.prodModel!.products[index].image,
                                  height: 250.0.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0.h),
                        CustomText(
                          text: controller.prodModel!.products[index].name,
                          fontSize: 16.0.sp,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomText(
                          text:
                              controller.prodModel!.products[index].description,
                          fontSize: 12.0.sp,
                          color: Colors.grey,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomText(
                          text:
                              "\$${controller.prodModel!.products[index].price}",
                          fontSize: 12.0.sp,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
