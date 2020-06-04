import 'package:card/provider/productsProvider.dart';
import 'package:card/screens/singleProductItemScreen.dart';
import 'package:card/widgets/productOverviewScreenSearchBtn/searchProductsBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const String routeName = "/productOverviewScreen";
  @override
  Widget build(BuildContext context) {
    final _loadedProduct = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Screen"),
        actions: <Widget>[
          //added search action button
          //when an search button is pressed then it will open new context
          // where user can search their products
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchProductsBar(),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[900].withOpacity(0.10),
        child: Container(
          margin: EdgeInsets.all(12),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            itemCount: _loadedProduct.productsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SingleProductItemScreen.routeName,
                    arguments: _loadedProduct.productsList[index].productId,
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
                        image:
                            _loadedProduct.productsList[index].productImageUrl,
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
                            _loadedProduct.productsList[index].productTitle,
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
    );
  }
}
