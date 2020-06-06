import 'package:flutter/material.dart';

class CategoryFiltersBtn extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icons;
  CategoryFiltersBtn({this.icons, this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            Icon(
              icons,
              size: 20,
              color: Colors.black.withOpacity(0.7),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
