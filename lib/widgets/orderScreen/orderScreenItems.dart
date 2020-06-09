import 'package:card/model/orderModel.dart';
import 'package:card/provider/orderProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'onTappedOrderItems.dart';
import 'orderItemsHeading.dart';

class OrderScreenItems extends StatefulWidget {
  @override
  _OrderScreenItemsState createState() => _OrderScreenItemsState();
}

class _OrderScreenItemsState extends State<OrderScreenItems> {
  bool _onTap = false;
  DateFormat _dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  @override
  Widget build(BuildContext context) {
    final _loadedOrdersValue = Provider.of<OrderModel>(context);
    final _callCancelMethod = Provider.of<OrderProvider>(context);

    return Dismissible(
      key: ValueKey(_loadedOrdersValue.orderDateTime.toString()),
      confirmDismiss: (direction) {
        return;
      },
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          _callCancelMethod.cancelOrder(_loadedOrdersValue.orderDateTime);
        });
      },
      child: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        color: Colors.blue[900].withOpacity(0.1),
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              margin: EdgeInsets.all(0),
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OrderItemsHeading(
                      orderId: _loadedOrdersValue.orderId,
                      orderDateTime: _dateFormat
                          .format(_loadedOrdersValue.orderDateTime)
                          .toString(),
                      totalamount: _loadedOrdersValue.totalAmount,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      // margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.5),
                          bottom: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.5),
                          right: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.5),
                          left: BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.5),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 0.5,
                          ),
                        ],
                        //color: Colors.blue,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _onTap = !_onTap;
                          });
                        },
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          _onTap ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_onTap)
              OnTappedOrderItems(
                cartModelList: _loadedOrdersValue.listOfCartModel,
              ),
          ],
        ),
      ),
    );
  }
}
