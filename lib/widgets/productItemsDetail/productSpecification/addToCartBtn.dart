import 'package:flutter/material.dart';

class AddToCartBtn extends StatefulWidget {
  final Function onTapped;
  AddToCartBtn({this.onTapped});
  @override
  _AddToCartBtnState createState() => _AddToCartBtnState();
}

class _AddToCartBtnState extends State<AddToCartBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapped,
      child: Container(
        margin: EdgeInsets.only(top: 3),
        width: 180,
        height: 50,
        child: Chip(
          padding: EdgeInsets.all(10),
          elevation: 3,
          backgroundColor: Colors.orange.withOpacity(0.50),
          shadowColor: Colors.red,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          labelStyle: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
          ),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.blueGrey,
              ),
              Text("Add To Cart"),
            ],
          ),
        ),
      ),
    );
  }
}
