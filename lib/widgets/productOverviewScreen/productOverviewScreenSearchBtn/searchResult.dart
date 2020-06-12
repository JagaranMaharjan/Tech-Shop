import 'dart:io';

import 'package:card/model/productModel.dart';
import 'package:card/provider/productsProvider.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  final String query;
  SearchResult({this.query});

  @override
  Widget build(BuildContext context) {
    final _loadedProducts = Provider.of<ProductProvider>(context);
    List<ProductModel> _result =
        query != null ? _loadedProducts.getSearchedItems(query) : [];
    return _result.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.info,
                size: 70,
                color: Colors.blue.withOpacity(0.80),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: <Widget>[
                  Center(
                    child: Text(
                      query,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.black.withOpacity(0.70),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      "Product Not Found !!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1,
                        color: Colors.blue.withOpacity(0.80),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : ListView.builder(
            itemCount: _result.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    //color: Colors.grey.withOpacity(0.10),
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(0),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(
                              File(_result[index].productImageUrl.toString())),
                        ),
                        /*Container(
                          child: Image.network(
                            _result[index].productImageUrl,
                            fit: BoxFit.fill,
                            height: 50,
                            width: 50,
                          ),
                        ),*/
                        title: RichText(
                          text: TextSpan(
                            text: _result[index]
                                .productTitle
                                .substring(0, query.length),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: _result[index]
                                    .productTitle
                                    .substring(query.length),
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        subtitle: Text(
                          "Rs. : ${_result[index].price.toInt().toString()}",
                          style: TextStyle(
                            color: Colors.red.withOpacity(0.60),
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          "Qty. : ${_result[index].quantity.toString()}",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.60),
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              SingleProductItemScreen.routeName,
                              arguments: _result[index].productId);
                        },
                        contentPadding: EdgeInsets.only(left: 10, right: 10)),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 0.2,
                  ),
                ],
              );
            },
          );
  }
}
