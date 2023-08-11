import 'dart:convert';

CatalogDetail catalogDetailFromJson(String str) =>
    CatalogDetail.fromJson(json.decode(str));

String catalogDetailToJson(CatalogDetail data) => json.encode(data.toJson());

class CatalogDetail {
  List<Product> products;

  CatalogDetail({
    required this.products,
  });

  factory CatalogDetail.fromJson(Map<String, dynamic> json) => CatalogDetail(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String name;
  String discript;
  int price;
  String color;
  String image;

  Product({
    required this.id,
    required this.name,
    required this.discript,
    required this.price,
    required this.color,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        discript: json["discript"],
        price: json["price"],
        color: json["color"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "discript": discript,
        "price": price,
        "color": color,
        "image": image,
      };
}
