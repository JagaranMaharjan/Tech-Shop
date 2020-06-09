import 'package:card/provider/orderProvider.dart';
import 'package:card/widgets/orderScreen/orderScreenItems.dart';
import 'package:card/widgets/popUpMdenuForAllScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = "orderScreen";
  @override
  Widget build(BuildContext context) {
    final _loadedOrderProducts =
        Provider.of<OrderProvider>(context, listen: true).orderList;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        actions: <Widget>[
          PopUpMenuForAllScreen(),
        ],
      ),
      body: _loadedOrderProducts.length == 0
          ? Container(
              color: Colors.blue[900].withOpacity(0.1),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      size: 50,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You have not "
                      "order products yet !!!",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              color: Colors.blue[900].withOpacity(0.1),
              child: ListView.builder(
                  itemCount: _loadedOrderProducts.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: _loadedOrderProducts[index],
                      child: OrderScreenItems(),
                    );
                  }),
            ),
    );
  }
}
