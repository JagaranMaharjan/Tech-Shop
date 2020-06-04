import 'package:card/provider/productsProvider.dart';
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
import 'package:provider/provider.dart';

import 'file:///D:/Courses/shop_app/card/lib/widgets/productItemsDetail/listTileWithTrailing.dart';

class SingleProductItemScreen extends StatelessWidget {
  static const String routeName = "singleProductItemScreen";
  @override
  Widget build(BuildContext context) {
    final String _getProductId =
        ModalRoute.of(context).settings.arguments.toString();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<ProductProvider>(
          builder: (context, _product, _) {
            final _getLoadedProduct = _product.findProductById(_getProductId);
            return Container(
              color: Colors.blue[900].withOpacity(0.10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  ProductsMainImage(
                    getImageUrl: _getLoadedProduct.productImageUrl,
                  ),
                  DisplayProductPrice(
                    productPrice: _getLoadedProduct.price,
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
                                productTitle: _getLoadedProduct.productTitle,
                              ),
                              DraggableScrollableDivider(),
                              ModelNumber(
                                  modelNumber: _getLoadedProduct.modelNo),
                              DraggableScrollableDivider(),
                              Specification(
                                title1: "Brand",
                                title2: "Category",
                                title3: "Type",
                                value1: _getLoadedProduct.brandName,
                                value2: _getLoadedProduct.productCategory,
                                value3: _getLoadedProduct.productType,
                              ),
                              DraggableScrollableDivider(),
                              Delivery(
                                deliveryTimeText: _getLoadedProduct.delivery,
                              ),
                              DraggableScrollableDivider(),
                              Policy(
                                  title1: "Return Policy",
                                  title2: "Refund "
                                      "Policy",
                                  title2List: _getLoadedProduct.refundPolicy,
                                  title1List: _getLoadedProduct.returnPolicy),
                              DraggableScrollableDivider(),
                              ListTileWithTrailing(
                                leadingIcon: Icon(
                                  Icons.confirmation_number,
                                  color: Colors.blueGrey,
                                  size: 25,
                                ),
                                title:
                                    "Stock                                            Qty. : "
                                    "${_getLoadedProduct.quantity}",
                              ),
                              DraggableScrollableDivider(),
                              ListTileWithTrailing(
                                leadingIcon: Icon(
                                  Icons.monetization_on,
                                  color: Colors.blueGrey,
                                  size: 25,
                                ),
                                title: "${_getLoadedProduct.price}",
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
            );
          },
        ),
      ),
    );
  }
}
