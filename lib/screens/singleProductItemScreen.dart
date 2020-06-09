import 'package:card/provider/cartProvider.dart';
import 'package:card/provider/productsProvider.dart';
import 'package:card/widgets/popUpMdenuForAllScreen.dart';
import 'package:card/widgets/productItemsDetail/cartBadge.dart';
import 'package:card/widgets/productItemsDetail/draggableScrollableDivider.dart';
import 'package:card/widgets/productItemsDetail/listTileWithTrailing.dart';
import 'package:card/widgets/productItemsDetail/orderNowAlertBox.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/addToCartBtn.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/delivery.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/modelNumber.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/policy.dart';
import 'package:card/widgets/productItemsDetail/productSpecification/specification.dart';
import 'package:card/widgets/productItemsDetail/productsMainImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class SingleProductItemScreen extends StatelessWidget {
  static const String routeName = "singleProductItemScreen";
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final String _getProductId =
        ModalRoute.of(context).settings.arguments.toString();
    final _getLoadedProduct =
        Provider.of<ProductProvider>(context).findProductById(_getProductId);
    final _loadProductToCart = Provider.of<CartProvider>(context);

    return Scaffold(
      key: _scaffold,
      /*appBar: AppBar(),*/
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue,
            expandedHeight: 500,
            floating: true,
            pinned: true,
            //snap: true,
            actions: <Widget>[
              CartBadge(),
              PopUpMenuForAllScreen(),
            ],
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
                      // DraggableScrollableDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          AddToCartBtn(
                            onTapped: () {},
                            icon: Icons.message,
                            title: "Msg",
                            containerColor: Colors.white.withOpacity(0.65),
                            iconColor: Colors.blueGrey,
                          ),
                          AddToCartBtn(
                            onTapped: () {
                              //added user carted products in cart list
                              _loadProductToCart.addToCart(
                                prodId: _getLoadedProduct.productId,
                                prodImgUrl: _getLoadedProduct.productImageUrl,
                                prodPrice: _getLoadedProduct.price,
                                prodTitle: _getLoadedProduct.productTitle,
                                prodQuantity: _getLoadedProduct.quantity,
                                userId: DateTime.now().toUtc().toString(),
                              );
                              _scaffold.currentState.removeCurrentSnackBar();
                              _scaffold.currentState.showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.blue,
                                  content: Text(
                                    "You have added ${_getLoadedProduct.productTitle.toLowerCase()} to cart "
                                    "items.",
                                    style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 500),
                                  action: SnackBarAction(
                                    label: "UNDO",
                                    textColor: Colors.yellow,
                                    onPressed: () {
                                      _loadProductToCart.removeItemsByProdId(
                                          _getLoadedProduct.productId);
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: Icons.shopping_cart,
                            title: "Add To Cart",
                            containerColor: Colors.yellow.withOpacity(0.65),
                            iconColor: Colors.blueGrey,
                          ),
                          AddToCartBtn(
                            onTapped: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  _loadProductToCart.addToCart(
                                    prodId: _getLoadedProduct.productId,
                                    prodImgUrl:
                                        _getLoadedProduct.productImageUrl,
                                    prodPrice: _getLoadedProduct.price,
                                    prodTitle: _getLoadedProduct.productTitle,
                                    prodQuantity: _getLoadedProduct.quantity,
                                    userId: DateTime.now().toUtc().toString(),
                                  );
                                  return OrderNowAlertDialog(
                                    prodId: _getLoadedProduct.productId,
                                  );
                                },
                              );
                            },
                            icon: Icons.shopping_basket,
                            title: "Order Now",
                            containerColor: Colors.orange,
                            iconColor: Colors.white.withOpacity(0.85),
                          ),
                        ],
                      ),
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
