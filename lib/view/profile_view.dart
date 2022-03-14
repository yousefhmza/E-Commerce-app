import 'package:ecommerce/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/view_model/profile_view_model.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class MenuItemModel {
  final String title;
  final String image;
  final Function() onTap;

  MenuItemModel({
    required this.title,
    required this.image,
    required this.onTap,
  });
}

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  static final ProfileViewModel profileViewModel = Get.find();

  final List<MenuItemModel> _items = [
    MenuItemModel(
      title: "تعديل الملف الشخصي",
      image: "assets/menu_icons/Icon_Edit-Profile.png",
      onTap: () {},
    ),
    MenuItemModel(
      title: "عنوان الشحن",
      image: "assets/menu_icons/Icon_Location.png",
      onTap: () {},
    ),
    MenuItemModel(
      title: "سجل الشراء",
      image: "assets/menu_icons/Icon_History.png",
      onTap: () {},
    ),
    MenuItemModel(
      title: "البطاقات الإئتمانية",
      image: "assets/menu_icons/Icon_Payment.png",
      onTap: () {},
    ),
    MenuItemModel(
      title: "الإشعارات",
      image: "assets/menu_icons/Icon_Alert.png",
      onTap: () {},
    ),
    MenuItemModel(
      title: "تسجيل الخروج",
      image: "assets/menu_icons/Icon_Exit.png",
      onTap: () {
        profileViewModel.signOut();
        Get.offAll(LoginView());
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) {
          return controller.isLoading.value
              ? const CircularProgressIndicator()
              : Container(
                  padding: EdgeInsetsDirectional.only(
                    top: 50.0.h,
                    start: 16.0.w,
                    end: 16.0.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50.0.r,
                                backgroundColor: Colors.grey.shade300,
                                backgroundImage: controller.userModel == null ||
                                        controller.userModel!.pic.isEmpty
                                    ? null
                                    : NetworkImage(controller.userModel!.pic),
                              ),
                              SizedBox(width: 20.0.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.userModel!.name,
                                    fontSize: 22.0.sp,
                                  ),
                                  CustomText(
                                    text: controller.userModel!.email,
                                    color: Colors.grey,
                                    fontSize: 18.0.sp,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 60.0.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              MenuItem(_items[index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20.0.h),
                          itemCount: _items.length,
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final MenuItemModel menuItemModel;

  const MenuItem(this.menuItemModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: menuItemModel.onTap,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(menuItemModel.image),
      title: CustomText(
        text: menuItemModel.title,
        fontSize: 20.0.sp,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 18.0.sp,
      ),
    );
  }
}
