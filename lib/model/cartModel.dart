import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  final String userId;
  final String prodId;
  final String prodTitle;
  final String prodImgUrl;
  final int quantity;
  final double prodPrice;
  final int totalQty;

  CartModel(
      {this.userId,
      this.prodId,
      this.prodTitle,
      this.prodImgUrl,
      this.quantity,
      this.prodPrice,
      this.totalQty});
}
