import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/category_model.dart';
import 'package:ecommerce/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    getCategories();
    getBestSellingProducts();
  }

  final CollectionReference _categoriesCollectionRef =
      FirebaseFirestore.instance.collection("categories");

  final CollectionReference _productsCollectionRef =
      FirebaseFirestore.instance.collection("products");

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  CategModel? categModel;

  ProdModel? prodModel;

  void getCategories() async {
    try {
      _isLoading.value = true;
      final categoriesList = await _categoriesCollectionRef.get();
      categModel = CategModel.fromJson(categoriesList.docs);
      _isLoading.value = false;
      update();
    } catch (e) {
      _isLoading.value = false;
      print(e);
      Get.snackbar("Please Check Your Connection", e.toString());
    }
  }

  void getBestSellingProducts() async {
    try {
      _isLoading.value = true;
      final productsList = await _productsCollectionRef.get();
      prodModel = ProdModel.fromJson(productsList.docs);
      _isLoading.value = false;
      update();
    } catch (e) {
      _isLoading.value = false;
      print(e);
      Get.snackbar("Please Check Your Connection", e.toString());
    }
  }
}
