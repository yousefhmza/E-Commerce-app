import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce/view/cart_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:ecommerce/view/profile_view.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();

  Widget get currentScreen => _currentScreen;

  int _navigatorIndex = 0;

  int get navigatorIndex => _navigatorIndex;

  void setNavigatorIndex(int index) {
    _navigatorIndex = index;
    switch (index) {
      case 0:
        {
          _currentScreen = HomeView();
        }
        break;
      case 1:
        {
          _currentScreen = CartView();
        }
        break;
      case 2:
        {
          _currentScreen = ProfileView();
        }
        break;
    }
    update();
  }
}
