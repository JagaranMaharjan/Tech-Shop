import 'package:card/provider/productsProvider.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:card/widgets/productOverviewScreen/categoryFilters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductOverviewScreenBody extends StatelessWidget {
  final bool highToLow;
  final bool lowToHigh;

  ProductOverviewScreenBody({this.highToLow, this.lowToHigh});

  @override
  Widget build(BuildContext context) {
    //used to sort list
    final _checkedProd = highToLow
        ? Provider.of<ProductProvider>(context).getListInDescendingOrder()
        : Provider.of<ProductProvider>(context).getListInAscendingOrder();
    //retrieve value from products provider as an object
    final _loadedProduct = Provider.of<ProductProvider>(context);

    int _itemCount = (_loadedProduct.filterProductListByPrice.isEmpty)
        ? _loadedProduct.productsList.length
        : _loadedProduct.filterProductListByPrice.length;
    final _getLoadedProducts = _loadedProduct.filterProductListByPrice.isEmpty
        ? _loadedProduct.productsList
        : _loadedProduct.filterProductListByPrice;
    //print(_loadedProduct.filterProductListByPrice);
    // print(_loadedProduct.filterProductListByPrice.length);
    return Container(
      color: Colors.blue[900].withOpacity(0.10),
      child: Column(
        children: <Widget>[
          CategoryFilters(),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(12),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                itemCount: _itemCount,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        SingleProductItemScreen.routeName,
                        arguments: _getLoadedProducts[index].productId,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
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
                            image: _getLoadedProducts[index].productImageUrl,
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
