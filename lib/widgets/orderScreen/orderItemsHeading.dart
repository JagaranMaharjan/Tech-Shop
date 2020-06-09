import 'package:flutter/material.dart';

class OrderItemsHeading extends StatelessWidget {
  final String orderId;
  final String orderDateTime;
  final double totalamount;
  OrderItemsHeading({this.orderId, this.orderDateTime, this.totalamount});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 190,
          height: 60,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FittedBox(
                child: Text(
                  "Order ID : $orderId",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      letterSpacing: 1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                fit: BoxFit.fill,
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  orderDateTime,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 130,
          height: 60,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                  color: Colors.grey, width: 0.5, style: BorderStyle.solid),
              bottom: BorderSide(
                  color: Colors.grey, width: 0.5, style: BorderStyle.solid),
              top: BorderSide(
                  color: Colors.grey, width: 0.5, style: BorderStyle.solid),
              left: BorderSide(
                  color: Colors.grey, width: 0.5, style: BorderStyle.solid),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Total Amount",
                style: TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              FittedBox(
                child: Text(
                  "Rs ${totalamount.toInt().toString()}",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    letterSpacing: 1,
                    fontSize: 14,
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
