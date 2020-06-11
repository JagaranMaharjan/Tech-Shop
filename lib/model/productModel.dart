import 'package:flutter/cupertino.dart';

//determine the structure of data
class ProductModel with ChangeNotifier {
  final String productId;
  final String productTitle;
  final String productImageUrl;
  final String modelNo;
  final String brandName;
  final String productCategory;
  final String productType;
  final String delivery;
  final List<String> returnPolicy;
  final List<String> refundPolicy;
  final int quantity;
  final double price;
  bool isFavorite = false;
  ProductModel({
    this.productId,
    this.productTitle,
    this.productImageUrl,
    this.modelNo,
    this.brandName,
    this.productCategory,
    this.productType,
    this.delivery,
    this.returnPolicy,
    this.refundPolicy,
    this.quantity,
    this.price,
    this.isFavorite,
  });

  void isToggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
    print("i am from proudct model");
    print(isFavorite);
  }
}
