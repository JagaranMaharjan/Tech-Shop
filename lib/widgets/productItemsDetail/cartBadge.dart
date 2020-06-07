import 'package:card/provider/cartProvider.dart';
import 'package:card/screens/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _getLoadedItemCount =
        Provider.of<CartProvider>(context).cartedItemsCount;
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(CartScreen.routeName);
      },
      icon: Container(
        child: Stack(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.blueGrey,
              size: 20,
            ),
            Positioned(
              top: 6,
              right: 2,
              child: Container(
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    _getLoadedItemCount.toString(),
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    // backgroundColor: Colors.red),
                  ),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
          alignment: Alignment.center,
        ),
        height: 50,
        width: 50,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
      ),
    );
  }
}
