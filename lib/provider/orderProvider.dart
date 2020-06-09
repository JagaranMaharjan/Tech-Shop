import 'package:card/model/cartModel.dart';
import 'package:card/model/orderModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orderModelList = [];

  List<OrderModel> get orderList {
    return [..._orderModelList];
  }

  void addNewOrders({List<CartModel> cartModelList, double totalAmount}) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    _orderModelList.insert(
      0,
      OrderModel(
        orderId: dateFormat.format(DateTime.now()),
        orderDateTime: DateTime.now(),
        listOfCartModel: cartModelList,
        totalAmount: totalAmount,
      ),
    );
    notifyListeners();
  }

  void cancelOrder(DateTime dateTime) {
    if (_orderModelList.contains(dateTime)) {
      print(_orderModelList);
      _orderModelList.remove(dateTime);
      print(_orderModelList);
      notifyListeners();
    }
  }
}
