import 'package:card/model/categoryModel.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  //created dummy category list
  List<CategoryModel> _categoryList = [
    CategoryModel(
      cid: "CID01",
      title: "Watch",
      imageUrl:
          "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    ),
    CategoryModel(
      cid: "CID02",
      title: "TV",
      imageUrl:
          "https://banner2.cleanpng.com/20180420/zbe/kisspng-lcd-television-led-backlit-lcd-liquid-crystal-disp-led-tv-5ada790d424a36.3607328015242672772715.jpg",
    ),
    CategoryModel(
      cid: "CID03",
      title: "Mobile",
      imageUrl:
          "https://www.pinclipart.com/picdir/middle/374-3742272_smartphone-mobile-png-image-background-iphone-x-clear.png",
    ),
    CategoryModel(
      cid: "CID04",
      title: "Laptop",
      imageUrl:
          "https://www.pngkey.com/png/full/298-2987277_lenovo-ideapad-320-15ikbn-hp-laptop-320-ideapad.png",
    ),
    CategoryModel(
      cid: "CID05",
      title: "Headphone",
      imageUrl:
          "https://purepng.com/public/uploads/large/purepng.com-headphoneelectronics-headset-headphone-941524670109tnfcf.png",
    ),
    CategoryModel(
      cid: "CID06",
      title: "Earphone",
      imageUrl:
          "https://www.pinclipart.com/picdir/middle/179-1798765_clip-art-earbuds-transparent-background-transparent-background-earphone.png",
    ),
    CategoryModel(
      cid: "CID07",
      title: "Desktop",
      imageUrl:
          "https://pngimage.net/wp-content/uploads/2018/05/desktop-png-icon-8.png",
    ),
    CategoryModel(
      cid: "CID08",
      title: "Mac",
      imageUrl:
          "https://www.macworld.co.uk/cmsdata/slideshow/3671133/runwindowsonmac_thumb1200_16-9.png",
    ),
  ];

  //returns category list
  List<CategoryModel> get categoryList {
    return [..._categoryList];
  }
}
