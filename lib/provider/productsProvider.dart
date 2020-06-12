import 'package:card/model/productModel.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  //dummy product model data list
  List<ProductModel> _productList = [
    /*ProductModel(
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
      isFavorite: false,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID002",
      productTitle: "Headphone",
      productImageUrl:
          "https://ae01.alicdn.com/kf/HTB1OnzZXROD3KVjSZFFq6An9pXaj/Tourya-B7-Wireless-Headphones-Bluetooth-Headset-Earphone-Headphone-Earbuds-Earphones-With-Microphone-For-PC-mobile-phone.jpg",
      modelNo: "MID002",
      brandName: "TISSOT",
      productCategory: "Headphone",
      productType: "Headphone",
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
      isFavorite: false,
      productId: "PID003",
      productTitle: "Earphone",
      productImageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/61L8y-ivo0L._SX425_.jpg",
      modelNo: "MID003",
      brandName: "TISSOT",
      productCategory: "Earphone",
      productType: "Earphone",
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
      price: 1300,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID004",
      productTitle: "HP Laptop",
      productImageUrl:
          "https://uniquec.com/wp-content/uploads/EQ0007AU-400x400.png",
      modelNo: "MID004",
      brandName: "TISSOT",
      productCategory: "Laptop",
      productType: "Laptop",
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
      price: 200000,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID005",
      productTitle: "Samsung TV",
      productImageUrl:
          "https://i5.walmartimages.com/asr/7f7bf134-fe22-4a64-b662-febd879230d0_1.ff76d63461b797a12b9a8a8933fbcbdc.jpeg",
      modelNo: "MID005",
      brandName: "TISSOT",
      productCategory: "TV",
      productType: "Digital",
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
      isFavorite: false,
      productId: "PID006",
      productTitle: "HITACHI TV",
      productImageUrl:
          "https://blackfridaytvs.com/wp-content/uploads/2014/11/Hitachi-LE55G508-55-1080p-120Hz-Class-LED-HDTV-Walmart-SKU-553106678.jpg",
      modelNo: "MID006",
      brandName: "TISSOT",
      productCategory: "TV",
      productType: "Digital",
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
      price: 45000,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID007",
      productTitle: "Elment TV",
      productImageUrl:
          "https://i5.walmartimages.com/asr/6da33047-7c3b-4b43-b3d9-bb2b91203e20_1.76880e584739c50de1d05df143e4c7d9.jpeg",
      modelNo: "MID007",
      brandName: "TISSOT",
      productCategory: "TV",
      productType: "Digital TV",
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
      price: 25000,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID008",
      productTitle: "Nokia",
      productImageUrl:
          "https://cf.shopee.com.my/file/5f1a5505b64f04485ebb2d90cfb3e907",
      modelNo: "MID008",
      brandName: "TISSOT",
      productCategory: "Mobile",
      productType: "Smart",
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
      isFavorite: false,
      productId: "PID009",
      productTitle: "Samsung Lite",
      productImageUrl:
          "https://s3.amazonaws.com/media.mediapost.com/dam/cropped/2020/01/03/galaxynote10lite_back_pen_auraglowf_F8I5ZAM.jpg",
      modelNo: "MID009",
      brandName: "TISSOT",
      productCategory: "Mobile",
      productType: "Smart",
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
      price: 70000,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID010",
      productTitle: "Mac Book",
      productImageUrl:
          "https://refreshcomputers.net/shop/wp-content/uploads/2018/07/13_macbook_pro-6.png",
      modelNo: "MID010",
      brandName: "TISSOT",
      productCategory: "Mac",
      productType: "Laptop",
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
      price: 170000,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID011",
      productTitle: "Dell Desktop",
      productImageUrl:
          "https://5.imimg.com/data5/DK/AQ/MY-22183248/dell-desktop-computer-500x500-500x500.jpg",
      modelNo: "MID0101",
      brandName: "TISSOT",
      productCategory: "Desktop",
      productType: "Desktop",
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
      price: 70000,
    ),
    ProductModel(
      isFavorite: false,
      productId: "PID012",
      productTitle: "Lenovo Laptop",
      productImageUrl:
          "https://i1.wp.com/www.unlimit-tech.com/wp-content/uploads/Lenovo-Legion-5.jpg?w=696&ssl=1",
      modelNo: "MID0102",
      brandName: "TISSOT",
      productCategory: "Laptop",
      productType: "Laptop",
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
    ),   */
  ];

  //getter method to get the list of products
  List<ProductModel> get productsList {
    //notifyListeners();
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

  //created empty list to store product details according to price selected
  // by users
  List<ProductModel> _filterByPrice = [];

  //return price filtered product list
  List<ProductModel> get filterProductListByPrice {
    return [..._filterByPrice];
  }

  //when user select price from drop down it will call this method to filter
  // the product details  according to user selected price
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

  //when user select price above 1 lakhs then it will call this method to
  // filter the product details according to user selected price
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

  //this method clear all data of filter list in order to display all products
  void clearFilterList() {
    _filterByPrice.clear();
    notifyListeners();
  }

  //created empty list to store product details according to users selected
  // category
  List<ProductModel> _categoryList = [];

  List<ProductModel> get categoryProductList {
    return [..._categoryList];
  }

  //this method will filter the products details according to users selected
  // category
  void categoryList(String categoryTitle) {
    _categoryList.clear();
    _productList.forEach((prodCtg) {
      if (prodCtg.productCategory == categoryTitle) {
        _categoryList.add(prodCtg);
      }
      notifyListeners();
    });
  }

  //this method clear category list data to  display all category products
  // details
  void clearCategoryList() {
    _categoryList.clear();
    notifyListeners();
  }

  List _productId = [];

  List get prodId {
    return [..._productId];
  }

  void productsValue() {
    productId = "";
    for (int i = 0; i < prodId.length; i++) {
      productId = prodId[i];
    }
    notifyListeners();
  }

  String productId = "";
  void getProdId(String prodTitle) {
    productId = "";
    _productId.clear();
    _productList.forEach(
      (prod) {
        if (prod.productTitle.toLowerCase() == prodTitle.toLowerCase()) {
          print("i am from produst provider");
          print(prod.productId);

          _productId.add(prod.productId);
        }
      },
    );
    notifyListeners();
  }

  //to add new product
  void addNewProduct({ProductModel productModel}) {
    _productList.add(productModel);
    notifyListeners();
    print("add to list");
    _productList.forEach((prod) {
      print(prod);
    });
  }
}
