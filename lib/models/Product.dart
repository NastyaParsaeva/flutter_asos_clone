import 'package:asos_clone/models/ProductSize.dart';

class Product {
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final bool isFavorited;
  final String color;
  final List<ProductSize> sizeList;
  final List<String> featureList;
  final String productCode;
  final String brand;
  final String care;
  final String about;
  final String modelSize;
  final String modelHeight;

  Product({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.isFavorited,
    this.color,
    this.sizeList,
    this.featureList,
    this.productCode,
    this.brand,
    this.care,
    this.about,
    this.modelSize,
    this.modelHeight,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> sizesJson = json['sizeList'];
    List<ProductSize> sizes = sizesJson == null
        ? null
        : (sizesJson as List)
            .map((item) => ProductSize.fromJson(item))
            .toList();
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      isFavorited: json['isFavorited'],
      color: json['color'],
      sizeList: sizes,
      featureList: json['featureList'].cast<String>(),
      productCode: json['productCode'],
      brand: json['brand'],
      care: json['care'],
      about: json['about'],
      modelSize: json['modelSize'],
      modelHeight: json['modelHeight'],
    );
  }
}
