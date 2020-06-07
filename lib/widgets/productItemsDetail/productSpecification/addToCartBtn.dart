import 'package:flutter/material.dart';

class AddToCartBtn extends StatelessWidget {
  final Function onTapped;
  final IconData icon;
  final Color iconColor;
  final String title;
  final Color containerColor;
  AddToCartBtn(
      {this.onTapped,
      this.iconColor,
      this.containerColor,
      this.icon,
      this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        //alignment: Alignment.bottomCenter,
        color: containerColor,
        margin: EdgeInsets.only(top: 0),
        width: 195,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              size: 25,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: iconColor,
                fontSize: 16,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
