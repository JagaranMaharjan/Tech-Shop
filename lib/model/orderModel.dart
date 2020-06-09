import 'package:card/model/cartModel.dart';
import 'package:flutter/material.dart';

class OrderModel with ChangeNotifier {
  final String orderId;
  final DateTime orderDateTime;
  final List<CartModel> listOfCartModel;
  final double totalAmount;
  OrderModel({
    this.orderId,
    this.orderDateTime,
    this.listOfCartModel,
    this.totalAmount,
  });
}
