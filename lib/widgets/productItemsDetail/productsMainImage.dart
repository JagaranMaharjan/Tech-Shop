import 'package:flutter/material.dart';

class ProductsMainImage extends StatelessWidget {
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
          "https://www.tissotwatches"
          ".com/media/shop/catalog/product/cache/all/image/550x"
          "/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1"
          ".png",
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),
      ),
    );
  }
}
