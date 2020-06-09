import 'package:card/provider/cartProvider.dart';
import 'package:card/provider/orderProvider.dart';
import 'package:card/screens/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderNowAlertDialog extends StatefulWidget {
  final String prodId;
  OrderNowAlertDialog({this.prodId});
  @override
  _OrderNowAlertDialogState createState() => _OrderNowAlertDialogState();
}

class _OrderNowAlertDialogState extends State<OrderNowAlertDialog> {
  int _qty = 1;
  @override
  Widget build(BuildContext context) {
    final _updateCartedQty = Provider.of<CartProvider>(context);
    final _addToOrderList = Provider.of<OrderProvider>(context);
    return AlertDialog(
      title: Text(
        "How many quantity do you want "
        "to order ?",
        style: TextStyle(
          color: Colors.blueGrey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      elevation: 3,
      content: Container(
        height: 60,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Quantity",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  child: Card(
                    elevation: 3,
                    child: IconButton(
                      onPressed: () {
                        if (_qty == 1) {
                          _updateCartedQty.clearCartedList();
                          Navigator.of(context).pop();
                        } else {
                          _updateCartedQty.decreaseCartedQuantity(
                              widget.prodId, 0);
                          setState(() {
                            _qty = _qty - 1;
                          });
                        }
                      },
                      padding: EdgeInsets.all(2),
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      "${_qty.toString()}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  child: Card(
                    elevation: 3,
                    child: IconButton(
                      onPressed: () {
                        if (_qty > 0) {
                          _updateCartedQty.increaseCartedQuantity(
                              widget.prodId, 0);
                          setState(
                            () {
                              _qty = _qty + 1;
                            },
                          );
                        }
                      },
                      padding: EdgeInsets.all(2),
                      alignment: Alignment.center,
                      icon: Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel Order"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Confirm Order"),
          onPressed: () {
            _addToOrderList.addNewOrders(
              totalAmount: _updateCartedQty.totalAmount,
              cartModelList: _updateCartedQty.cartedList.values.toList(),
            );
            _updateCartedQty.clearCartedList();
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          },
        ),
      ],
    );
  }
}
