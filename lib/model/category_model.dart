
class CategModel {
  List<CategoryModel> categories = [];

  CategModel.fromJson(var json) {
    for (var element in json) {
      categories.add(CategoryModel.fromJSon(element));
    }
  }
}

class CategoryModel {
  final String name;
  final String image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJSon(var json) => CategoryModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
    };
  }
}
