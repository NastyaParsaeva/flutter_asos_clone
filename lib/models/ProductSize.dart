class ProductSize {
  final String sizeName;
  final bool available;

  ProductSize({this.sizeName, this.available});

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return json == null
        ? null
        : ProductSize(
            sizeName: json['sizeName'],
            available: json['available'],
          );
  }
}
