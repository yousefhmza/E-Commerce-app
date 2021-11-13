import 'package:ecommerce/core/services/databases/cart_database_helper.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getProducts();
  }

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  ValueNotifier<bool> get isLoading => _isLoading;

  List<CartProductModel> _cartProductsList = [];

  List<CartProductModel> get cartProductsList => _cartProductsList;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  void addProduct(CartProductModel cartProductModel) async {
    for (var element in _cartProductsList) {
      if (element.productID == cartProductModel.productID) {
        return;
      }
    }
    CartDatabaseHelper dbInstance = CartDatabaseHelper.instance;
    await dbInstance.insertData(cartProductModel);
    _cartProductsList.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  void getProducts() async {
    _isLoading.value = true;
    CartDatabaseHelper dbInstance = CartDatabaseHelper.instance;
    _cartProductsList = await dbInstance.getData();
    _isLoading.value = false;
    getTotalPrice();
    update();
  }

  void getTotalPrice() {
    for (var element in _cartProductsList) {
      _totalPrice += (double.parse(element.price) * element.quantity);
    }
    print(_totalPrice);
    update();
  }

  void increaseQuantity(int index) async {
    _cartProductsList[index].quantity++;
    _totalPrice += double.parse(_cartProductsList[index].price);
    await CartDatabaseHelper.instance.updateData(_cartProductsList[index]);
    update();
  }

  void decreaseQuantity(int index) async {
    if (_cartProductsList[index].quantity > 0) {
      _cartProductsList[index].quantity--;
      _totalPrice -= double.parse(_cartProductsList[index].price);
      await CartDatabaseHelper.instance.updateData(_cartProductsList[index]);
    }
    update();
  }
}
