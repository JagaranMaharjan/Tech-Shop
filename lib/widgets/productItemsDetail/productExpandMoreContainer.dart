import 'package:flutter/material.dart';

class ProductExpandMoreContainer extends StatelessWidget {
  final double containerHeight;
  final Widget child;
  ProductExpandMoreContainer({this.containerHeight, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: containerHeight,
      padding: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        //color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
