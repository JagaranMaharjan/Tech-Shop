import 'package:card/widgets/productItemsDetail/displayPoductPrice.dart';
import 'package:card/widgets/productItemsDetail/draggableScrollableDivider.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/addToCartBtn.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/delivery.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/modelNumber.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/policy.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/productTitle.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/specification.dart';
import 'package:card/widgets/productItemsDetail/productsMainImage.dart';
import 'package:flutter/material.dart';

import 'file:///D:/Courses/shop_app/card/lib/widgets/productItemsDetail/listTileWithTrailing.dart';

class SingleProductItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.blue[900].withOpacity(0.10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              ProductsMainImage(),
              DisplayProductPrice(
                productPrice: 1000,
              ),
              DraggableScrollableSheet(
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey,
                          blurRadius: 1,
                        ),
                      ],
                      color: Colors.white.withOpacity(0.88),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: <Widget>[
                          ProductTitle(
                            productTitle: "Watch",
                          ),
                          DraggableScrollableDivider(),
                          ModelNumber(modelNumber: "MID001"),
                          DraggableScrollableDivider(),
                          Specification(
                            title1: "Brand",
                            title2: "Category",
                            title3: "Type",
                            value1: "Brand Name",
                            value2: "Category Name",
                            value3: "Type Name",
                          ),
                          DraggableScrollableDivider(),
                          Delivery(
                            deliveryTimeText: "Within 7 days.",
                          ),
                          DraggableScrollableDivider(),
                          Policy(
                            title1: "Return Policy",
                            title2: "Refund "
                                "Policy",
                            title2List: [
                              "1. If wrong products "
                                  "were placed.",
                              "2. If damage products were "
                                  "placed.",
                              "3. If ordered products does not "
                                  "placed on time."
                            ],
                            title1List: [
                              "1. If wrong products "
                                  "were placed.",
                              "2. If damage products were "
                                  "placed."
                            ],
                          ),
                          DraggableScrollableDivider(),
                          ListTileWithTrailing(
                            leadingIcon: Icon(
                              Icons.confirmation_number,
                              color: Colors.blueGrey,
                              size: 25,
                            ),
                            title: "Stock",
                          ),
                          DraggableScrollableDivider(),
                          ListTileWithTrailing(
                            leadingIcon: Icon(
                              Icons.attach_money,
                              color: Colors.blueGrey,
                              size: 25,
                            ),
                            title: "Price",
                          ),
                          DraggableScrollableDivider(),
                          AddToCartBtn(),
                        ],
                      ),
                    ),
                  );
                },
                initialChildSize: 0.45,
                minChildSize: 0.45,
                maxChildSize: 0.75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
