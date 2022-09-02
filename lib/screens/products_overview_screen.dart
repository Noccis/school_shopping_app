import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/modal_sheet.dart';
import 'package:shopping_app/widgets/product_item.dart';
import '../models/product.dart';
import 'add_screen.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // void sheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return GestureDetector(child: ModalSheet(add));
  //       });
  // }

  void add(String id, String title, String description, double price,
      String imageUrl) {
    final newObject = Product(
        title: title,
        id: id,
        description: description,
        price: price,
        imageUrl: imageUrl);

    setState(() {
      loadedProducts.add(newObject);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBaren = AppBar(
      title: Text('Min shop'),
    );

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Platform.isAndroid
        ? Scaffold(
            appBar: appBaren,
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isPortrait ? 2 : 4,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: loadedProducts.length,
              itemBuilder: (context, i) => ProductItem(
                id: loadedProducts[i].id,
                title: loadedProducts[i].title,
                imageUrl: loadedProducts[i].imageUrl,
              ),
              padding: isPortrait
                  ? EdgeInsets.all(10)
                  : EdgeInsets.only(right: 40, top: 10, bottom: 10, left: 40),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddPage(add),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          )
        : CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Shopping app'),
            ),
            child: Center(
              child: Column(
                children: <Widget>[Text('isIOS')],
              ),
            ),
          );
  }
}
