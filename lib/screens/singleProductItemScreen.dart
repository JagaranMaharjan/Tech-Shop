import 'package:card/provider/productsProvider.dart';
import 'package:card/widgets/productItemsDetail/draggableScrollableDivider.dart';
import 'package:card/widgets/productItemsDetail/listTileWithTrailing.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/addToCartBtn.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/delivery.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/modelNumber.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/policy.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/specification.dart';
import 'package:card/widgets/productItemsDetail/productsMainImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleProductItemScreen extends StatelessWidget {
  static const String routeName = "singleProductItemScreen";
  @override
  Widget build(BuildContext context) {
    final String _getProductId =
        ModalRoute.of(context).settings.arguments.toString();
    final _getLoadedProduct =
        Provider.of<ProductProvider>(context).findProductById(_getProductId);
    return Scaffold(
      /*appBar: AppBar(),*/
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 500,
            floating: true,
            pinned: true,
            //snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(_getLoadedProduct.productTitle),
              background: ProductsMainImage(
                getImageUrl: _getLoadedProduct.productImageUrl,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 1,
                    ),
                  ],
                  color: Colors.white.withOpacity(0.88),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,

                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ModelNumber(modelNumber: _getLoadedProduct.modelNo),
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
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
