import 'package:card/model/productModel.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  //dummy product model data list
  List<ProductModel> _productList = [
    ProductModel(
      productId: "PID001",
      productTitle: "Watch",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID001",
      brandName: "TISSOT",
      productCategory: "Watch",
      productType: "Analog",
      delivery: "Within 7 days",
      returnPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed.",
        "3. If ordered products does not "
            "placed on time."
      ],
      refundPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed."
      ],
      quantity: 50,
      price: 50000,
    ),
    ProductModel(
      productId: "PID002",
      productTitle: "Watch 1",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID002",
      brandName: "TISSOT",
      productCategory: "Watch",
      productType: "Analog",
      delivery: "Within 7 days",
      returnPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed.",
        "3. If ordered products does not "
            "placed on time."
      ],
      refundPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed."
      ],
      quantity: 50,
      price: 50000,
    ),
    ProductModel(
      productId: "PID003",
      productTitle: "Watch 2",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID003",
      brandName: "TISSOT",
      productCategory: "Watch",
      productType: "Analog",
      delivery: "Within 7 days",
      returnPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed.",
        "3. If ordered products does not "
            "placed on time."
      ],
      refundPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed."
      ],
      quantity: 50,
      price: 50000,
    ),
    ProductModel(
      productId: "PID004",
      productTitle: "Watch 3",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID004",
      brandName: "TISSOT",
      productCategory: "Watch",
      productType: "Analog",
      delivery: "Within 7 days",
      returnPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed.",
        "3. If ordered products does not "
            "placed on time."
      ],
      refundPolicy: [
        "1. If wrong products "
            "were placed.",
        "2. If damage products were "
            "placed."
      ],
      quantity: 50,
      price: 50000,
    ),
  ];

  //getter method to get the list of products
  List<ProductModel> get productsList {
    return [..._productList];
  }

  //to get details of single product according to product id
  ProductModel findProductById(String _productId) {
    return productsList.firstWhere((prod) => prod.productId == _productId);
  }

  //created empty list to add data according to query of search products bar
  final List<ProductModel> _searchList = [];

  //According to query of search products bar it will add products data
  // temporarily in _searchList only if users query matched with productList
  // product title
  List<ProductModel> getSearchedItems(String query) {
    _searchList.clear(); //it will remove all data from the list
    productsList.forEach((prod) {
      if (prod.productTitle.toLowerCase().contains(query.toLowerCase())) {
        _searchList.add(prod);
      }
    });
    return _searchList; //return search list value
  }
}
