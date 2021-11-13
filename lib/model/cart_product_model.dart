import 'package:flutter/material.dart';

import 'package:ecommerce/helper/extension.dart';

class PModel {
  List<CartProductModel> products = [];

  PModel.fromJson(var json) {
    for (var element in json) {
      products.add(CartProductModel.fromJson(element));
    }
  }
}

class CartProductModel {
  final String name;
  final String productID;
  final String image;
  final String price;
   int quantity;

  CartProductModel({
    required this.productID,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory CartProductModel.fromJson(var json) => CartProductModel(
        productID: json["productID"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() {
    return {
      "productID": productID,
      "name": name,
      "image": image,
      "price": price,
      "quantity": quantity,
    };
  }
}
