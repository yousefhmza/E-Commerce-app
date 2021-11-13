import 'package:flutter/material.dart';

import 'package:ecommerce/helper/extension.dart';

class ProdModel {
  List<ProductModel> products = [];

  ProdModel.fromJson(var json) {
    for (var element in json) {
      products.add(ProductModel.fromJson(element));
    }
  }
}

class ProductModel {
  final String productID;
  final String name;
  final String description;
  final String image;
  final String price;
  final Color color;
  final String size;

  ProductModel({
    required this.productID,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.color,
    required this.size,
  });

  factory ProductModel.fromJson(var json) => ProductModel(
        productID: json["productID"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        color: HexColor.fromHex(json["color"]),
        size: json["size"],
      );

  Map<String, dynamic> toJson() {
    return {
      "productID": productID,
      "name": name,
      "description": description,
      "image": image,
      "price": price,
      "color": color,
      "size": size,
    };
  }
}
