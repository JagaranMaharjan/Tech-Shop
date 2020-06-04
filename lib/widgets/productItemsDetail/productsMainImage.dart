import 'package:flutter/material.dart';

class ProductsMainImage extends StatelessWidget {
  final String getImageUrl;
  ProductsMainImage({this.getImageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      //color: Colors.blue,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 60, left: 0, right: 0),
        padding: EdgeInsets.only(bottom: 10, left: 0, right: 0, top: 10),
        child: Image.network(
          getImageUrl,
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),
      ),
    );
  }
}
