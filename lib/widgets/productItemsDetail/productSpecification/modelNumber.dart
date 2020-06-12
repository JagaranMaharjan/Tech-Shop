import 'package:card/provider/productsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelNumber extends StatelessWidget {
  final String prodId;
  ModelNumber({this.prodId});
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Consumer<ProductProvider>(
        builder: (_, prodProv, child) {
          return IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              prodProv.findProductById(prodId).isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
              size: 25,
            ),
            onPressed: () {
              prodProv.findProductById(prodId).isToggleFavorite();
            },
          );
        },
      ),
      leading: Icon(
        Icons.short_text,
        color: Colors.blueGrey,
        size: 25,
      ),
    );
  }
}
