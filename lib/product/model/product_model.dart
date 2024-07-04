import 'base_model.dart';

class Product extends BaseFirebaseModel<Product> {
  final String? categoryId;
  String? productName;
  String? productImageUrl;
  int? stock;
  double? price;

  Product(
      {this.categoryId,
      this.productName,
      this.productImageUrl,
      this.stock,
      this.price,
      String? id})
      : super(id);

  @override
  Map<String, dynamic> get toJson => {
        'productName': productName,
        'categoryId': categoryId,
        'productImageUrl': productImageUrl,
        'stock': stock,
        'price': price,
      };

  @override
  Product fromJson(Map<String, dynamic> json) {
    return Product(
      productImageUrl: json['productImageUrl'],
      categoryId: json['categoryId'],
      stock: json['stock'],
      productName: json['productName'],
      price: json['price'],
      id: json['id'],
    );
  }
}
