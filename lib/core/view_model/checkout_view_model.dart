import 'package:ecommerce/helper/enums.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:ecommerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int _index = 0;

  int get index => _index;

  Pages _pages = Pages.deliveryTime;

  Pages get pages => _pages;

  String? street1, street2, city, state, country;

  void setIndex(int i) {
    if (i == 1) {
      _pages = Pages.addAddress;
      _index = i;
    } else if (i == 2) {
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        _pages = Pages.summary;
        _index = i;
      }
    } else if (i == 3) {
      Get.to(() => ControlView());
    }
    update();
  }

  Color getColor(int index) {
    if (index == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
    update();
  }
}
