import 'package:card/screens/singleProductItemScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const String routeName = "/productOverviewScreen";

  List<String> image = [
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
    "https://www.tissotwatches.com/media/shop/catalog/product/cache/all/image/550x/17f82f742ffe127f42dca9de82fb58b1/T/1/T127.410.11.041.00_1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Screen"),
      ),
      body: Container(
        //color: Colors.red,
        margin: EdgeInsets.all(12),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          itemCount: image.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(SingleProductItemScreen.routeName);
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
                      image: image[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  footer: Container(
                    //color: Colors.black12,
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
                          "Watch",
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
    );
  }
}
