import 'package:card/provider/cartProvider.dart';
import 'package:card/provider/orderProvider.dart';
import 'package:card/screens/orderScreen.dart';
import 'package:card/widgets/cartScreen/cartedItems.dart';
import 'package:card/widgets/popUpMdenuForAllScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "cartScreen";

  @override
  Widget build(BuildContext context) {
    final _getLoadedCart = Provider.of<CartProvider>(context);
    final _addNewOrder = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
        actions: <Widget>[
          PopUpMenuForAllScreen(),
        ],
      ),
      body: Container(
        color: Colors.blue[900].withOpacity(0.1),
        child: Column(
          children: <Widget>[
            _getLoadedCart.cartedItemsCount == 0
                ? Expanded(
                    child: Container(
                      //color: Colors.red,
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.info,
                            size: 80,
                            color: Colors.blueGrey,
                          ),
                          Text(
                            "You Have Not Carted Products Yet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Card(
                    margin: EdgeInsets.all(0),
                    elevation: 3,
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            // color: Colors.blue,
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.all(0),
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Total Amount :",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
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
                                    "${_getLoadedCart.totalAmount.toInt().toString()}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey,
                                      //fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Are you sure ?",
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          if (_getLoadedCart.cartedItemsCount !=
                                              0) {
                                            _addNewOrder.addNewOrders(
                                              cartModelList: _getLoadedCart
                                                  .cartedList.values
                                                  .toList(),
                                              totalAmount:
                                                  _getLoadedCart.totalAmount,
                                            );
                                            //print(_addNewOrder.orderList);
                                            _getLoadedCart.clearCartedList();
                                            Navigator.of(context).pop();
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    OrderScreen.routeName);
                                          }
                                        },
                                      ),
                                    ],
                                    content: Container(
                                      padding: EdgeInsets.all(0),
                                      margin: EdgeInsets.all(0),
                                      width: double.infinity,
                                      height: 40,
                                      child: Text(
                                        "Do you want to order carted products"
                                        " ?",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 1,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Chip(
                              padding: EdgeInsets.all(5),
                              elevation: 3,
                              backgroundColor: Colors.orange,
                              labelPadding: EdgeInsets.all(3),
                              label: Container(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.shopping_basket,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      "Order Now",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Expanded(
              child: ListView.builder(
                  itemCount: _getLoadedCart.cartedItemsCount,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: _getLoadedCart.cartedList.values.toList()[index],
                      child: CartedItems(
                        index: index,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
