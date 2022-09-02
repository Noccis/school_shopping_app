import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl as String,
        fit: BoxFit
            .cover, // Ser till att bilderna har samma storlek och beskärs för att fylla ytan
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {},),
        backgroundColor: Colors.black38,
        title: Text(
          title as String,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
