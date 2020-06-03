import 'package:flutter/material.dart';

class DisplayProductPrice extends StatelessWidget {
  final double productPrice;
  DisplayProductPrice({this.productPrice});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 340,
      right: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 120,
        height: 40,
        color: Colors.black12,
        child: Text(
          "Rs. : $productPrice",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
