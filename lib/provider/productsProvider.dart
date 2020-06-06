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
      price: 500,
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
      price: 1000,
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
      price: 1500,
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
      price: 2000,
    ),
    ProductModel(
      productId: "PID005",
      productTitle: "Watch",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID005",
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
      price: 500,
    ),
    ProductModel(
      productId: "PID006",
      productTitle: "Watch 1",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID006",
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
      price: 1000,
    ),
    ProductModel(
      productId: "PID007",
      productTitle: "Watch 2",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID007",
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
      price: 1500,
    ),
    ProductModel(
      productId: "PID008",
      productTitle: "Watch 3",
      productImageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
      modelNo: "MID008",
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
      price: 2000,
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
      if (prod.productTitle.toLowerCase().startsWith(query.toLowerCase())) {
        _searchList.add(prod);
      }
    });
    return _searchList; //return search list value
  }

  //this method is used to sort the product list in ascending order according
  // to price
  void getListInAscendingOrder() {
    if (_filterByPrice.isEmpty) {
      _productList.sort((a, b) => a.price.compareTo(b.price));
    } else {
      _filterByPrice.sort((a, b) => a.price.compareTo(b.price));
    }

    // print(_productList);
  }

  //this method is used to sort product list in descending order according to
  // price
  void getListInDescendingOrder() {
    if (_filterByPrice.isEmpty) {
      _productList.sort((b, a) => a.price.compareTo(b.price));
    } else {
      _filterByPrice.sort((b, a) => a.price.compareTo(b.price));
    }
    // print(_productList);
  }

  List<ProductModel> _filterByPrice = [];

  List<ProductModel> get filterProductListByPrice {
    return [..._filterByPrice];
  }

  void filterProductsListByPrice(double lowPrice, double highPrice) {
    _filterByPrice.clear();
    _productList.forEach(
      (prod) {
        if (prod.price >= lowPrice && prod.price < highPrice) {
          _filterByPrice.add(prod);
        }
      },
    );
    notifyListeners();
    //print(_filterByPrice);
  }

  void filterProductsListByHighPrice(double highPrice) {
    _filterByPrice.clear();
    _productList.forEach(
      (prod) {
        if (prod.price > highPrice) {
          _filterByPrice.add(prod);
        }
      },
    );
    notifyListeners();
    // print(_filterByPrice);
  }

  void clearFilterList() {
    _filterByPrice.clear();
    notifyListeners();
  }
}
