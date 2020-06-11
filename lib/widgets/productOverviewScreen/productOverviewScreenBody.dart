import 'package:card/provider/productsProvider.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:card/widgets/productOverviewScreen/categoryFilters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductOverviewScreenBody extends StatefulWidget {
  final bool highToLow;
  final bool lowToHigh;

  ProductOverviewScreenBody({this.highToLow, this.lowToHigh});

  @override
  _ProductOverviewScreenBodyState createState() =>
      _ProductOverviewScreenBodyState();
}

class _ProductOverviewScreenBodyState extends State<ProductOverviewScreenBody> {
  //declaration of variable
  bool _showFilter = false;
  var _getLoadedProducts;
  int _itemCount = 0;

  //show filter methods will display  products details according to price range
  // selected by users otherwise it will display all products
  void showFilter() {
    //retrieve value from products provider as an object
    final _loadedProduct = Provider.of<ProductProvider>(context, listen: true);
    //used to sort list
    final _checkedProd = widget.highToLow
        ? Provider.of<ProductProvider>(context).getListInDescendingOrder()
        : Provider.of<ProductProvider>(context).getListInAscendingOrder();
    if (_showFilter) {
      _itemCount = _loadedProduct.filterProductListByPrice.length;
      _getLoadedProducts = _loadedProduct.filterProductListByPrice;
    } else {
      _itemCount = _loadedProduct.productsList.length;
      _getLoadedProducts = _loadedProduct.productsList;
    }
  }

  //if user had selected any price range then it will call this method to
  // display products by filtering
  void toggleFilters() {
    setState(() {
      _showFilter = true;
    });
  }

  //if user had not selected any price range then it will call this method to
  // display all products of product list
  void showAllProducts() {
    setState(() {
      _showFilter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //filter method was called
    showFilter();
    return Container(
      color: Colors.blue[900].withOpacity(0.10),
      child: Column(
        children: <Widget>[
          CategoryFilters(
            showFilter: toggleFilters,
            showAll: showAllProducts,
          ),
          Expanded(
            child: _itemCount == 0
                ? Center(
                    child: Text("In Selected Price Category, Products Are Not"
                        " Available Now !!!"))
                : Container(
                    margin: EdgeInsets.all(12),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      itemCount: _itemCount,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(
                              SingleProductItemScreen.routeName,
                              arguments: _getLoadedProducts[index].productId,
                            );
                          },
                          child: Hero(
                            tag: _getLoadedProducts[index].productId,
                            child: Container(
                              decoration: BoxDecoration(
                                // color: Colors.transparent,
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.5,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.5,
                                  ),
                                  left: BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.5,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: GridTile(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: _getLoadedProducts[index]
                                        .productImageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                footer: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                    ),
                                  ),
                                  height: 50,
                                  width: double.infinity,
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Text(
                                        _getLoadedProducts[index].productTitle,
                                        style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.count(1, index.isEven ? 1.5 : 1.1);
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
