import 'package:card/model/cartModel.dart';
import 'package:card/provider/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartedItems extends StatelessWidget {
  final int index;
  CartedItems({this.index});
  @override
  Widget build(BuildContext context) {
    final _getLoadedCart = Provider.of<CartModel>(context);
    final _callMethods = Provider.of<CartProvider>(context);
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        width: double.infinity,
        height: 100,
        child: Row(
          children: <Widget>[
            Image.network(
              _getLoadedCart.prodImgUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _getLoadedCart.prodTitle,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      "Price : Rs. ${_getLoadedCart.quantity * _getLoadedCart.prodPrice}",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                        // fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              //color: Colors.yellow,
              decoration: BoxDecoration(
                //color: Colors.yellow,
                border: Border(
                  top: BorderSide(
                      color: Colors.grey, style: BorderStyle.solid, width: 0.5),
                  bottom: BorderSide(
                      color: Colors.grey, style: BorderStyle.solid, width: 0.5),
                  right: BorderSide(
                      color: Colors.grey, style: BorderStyle.solid, width: 0.5),
                  left: BorderSide(
                      color: Colors.grey, style: BorderStyle.solid, width: 0.5),
                ),
              ),
              width: 110,
              height: 70,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(top: 5, left: 0, right: 0, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        child: Card(
                          elevation: 3,
                          child: IconButton(
                            onPressed: () {
                              _callMethods.decreaseCartedQuantity(
                                  _getLoadedCart.prodId, index);
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
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(
                            _getLoadedCart.quantity.toString(),
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
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        padding: EdgeInsets.all(0),
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        child: Card(
                          elevation: 3,
                          child: IconButton(
                            onPressed: () {
                              _callMethods.increaseCartedQuantity(
                                _getLoadedCart.prodId,
                                index,
                              );
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
          ],
        ),
      ),
    );
  }
}
