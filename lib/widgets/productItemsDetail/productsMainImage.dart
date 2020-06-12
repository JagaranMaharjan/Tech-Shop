import 'dart:io';

import 'package:flutter/material.dart';

class ProductsMainImage extends StatelessWidget {
  final File getImageUrl;
  ProductsMainImage({this.getImageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: double.infinity,
      //color: Colors.blue,
      child: Container(
        margin: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        padding: EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 10),
        child: CircleAvatar(
          backgroundImage: FileImage(
            getImageUrl,
          ),
        ),
        /*Image.network(
          getImageUrl,
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),*/
      ),
    );
  }
}
