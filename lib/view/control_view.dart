import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/core/view_model/auth_view_model.dart';
import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/core/view_model/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<AuthViewModel>().user == null
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              builder: (controller) {
                return Scaffold(
                  body: controller.currentScreen,
                  bottomNavigationBar: const BNB(),
                );
              },
            ),
    );
  }
}

class BNB extends StatelessWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.navigatorIndex,
          onTap: (index) {
            controller.setNavigatorIndex(index);
          },
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              activeIcon: const Text(
                "الرئيسية",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: Image.asset("assets/images/Icon_Explore.png"),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: const Text(
                "العربة",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: Image.asset("assets/images/Icon_Cart.png"),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: const Text(
                "الملف الشخصي",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: Image.asset("assets/images/Icon_User.png"),
              label: "",
            ),
          ],
        );
      },
    );
  }
}
