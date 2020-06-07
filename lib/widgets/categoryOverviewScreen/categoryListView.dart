import 'package:card/provider/productsProvider.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loadedProdList = Provider.of<ProductProvider>(context);

    int _itemCount = _loadedProdList.categoryProductList.isEmpty
        ? _loadedProdList.productsList.length
        : _loadedProdList.categoryProductList.length;
    final _loadedValue = _loadedProdList.categoryProductList.isEmpty
        ? _loadedProdList.productsList
        : _loadedProdList.categoryProductList;
    return Expanded(
      child: GridView.builder(
        itemCount: _itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SingleProductItemScreen.routeName,
                  arguments: _loadedValue[index].productId);
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.5))],
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                  right: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                  left: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    _loadedValue[index].productImageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: double.infinity,
                      color: Colors.black54,
                      child: Text(
                        _loadedValue[index].productTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
