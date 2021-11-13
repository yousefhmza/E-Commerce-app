import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/view/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> getUser() async {
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  Future<UserModel?> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(CACHED_USER_DATA);
    if (value == null) {
      return null;
    }
    return UserModel.fromJson(json.decode(value));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
