import 'package:card/model/cartModel.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get cartedList {
    return {..._cartItems};
  }

  //this method will add carted product on cartItems list
  void addToCart({
    String userId,
    String prodId,
    String prodTitle,
    String prodImgUrl,
    int prodQuantity,
    double prodPrice,
  }) {
    //if user add same product to cart then it will increase quantity only
    // other wise it will add as new carted element in list
    if (_cartItems.containsKey(prodId)) {
      _cartItems.update(
        prodId,
        (existingProd) {
          return CartModel(
            userId: existingProd.userId,
            prodTitle: existingProd.prodTitle,
            prodPrice: existingProd.prodPrice,
            prodImgUrl: existingProd.prodImgUrl,
            prodId: existingProd.prodId,
            quantity: existingProd.quantity + 1,
          );
        },
      );
    } else {
      _cartItems.putIfAbsent(
        prodId,
        () {
          return CartModel(
            prodId: prodId,
            prodImgUrl: prodImgUrl,
            prodPrice: prodPrice,
            prodTitle: prodTitle,
            userId: userId,
            quantity: 1,
          );
        },
      );
    }
    // print(_cartItems);
    notifyListeners();
  }

  //it will return length of cart items list if it has some element other wise
  // it will return 0
  int get cartedItemsCount {
    return _cartItems == null ? 0 : _cartItems.length;
  }

  //it will decrease user carted products quantity by 1
  void decreaseCartedQuantity(String prodId) {
    if (_cartItems.containsKey(prodId)) {
      _cartItems.update(
        prodId,
        (_existingProd) {
          return CartModel(
            userId: _existingProd.userId,
            prodTitle: _existingProd.prodTitle,
            prodPrice: _existingProd.prodPrice,
            prodImgUrl: _existingProd.prodImgUrl,
            prodId: _existingProd.prodId,
            quantity: _existingProd.quantity - 1,
          );
          //notifyListeners();
        },
      );
    }
    filterCartedList();
    notifyListeners();
  }

  //it will increase user carted products quantity by 1
  void increaseCartedQuantity(String prodId) {
    if (_cartItems.containsKey(prodId)) {
      _cartItems.update(
        prodId,
        (_existingProd) {
          return CartModel(
            userId: _existingProd.userId,
            prodTitle: _existingProd.prodTitle,
            prodPrice: _existingProd.prodPrice,
            prodImgUrl: _existingProd.prodImgUrl,
            prodId: _existingProd.prodId,
            quantity: _existingProd.quantity + 1,
          );
          //notifyListeners();
        },
      );
    }
    filterCartedList();
    notifyListeners();
  }

  //if user carted products quantity is less than 0 then it will remove that
  // product items from list
  void filterCartedList() {
    try {
      _cartItems.forEach((key, value) {
        if (value.quantity == 0) {
          _cartItems.remove(value.prodId);
          notifyListeners();
        }
      });
    } catch (error) {
      // print(error);
      // throw error;
    }
  }

  //it will return total amount according to user carted products and quantity
  double get totalAmount {
    double _totalAmount = 0;
    _cartItems.forEach((key, value) {
      _totalAmount += (value.quantity * value.prodPrice);
    });
    return _totalAmount;
  }
}
