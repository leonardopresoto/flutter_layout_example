import 'package:flutter/material.dart';

import '../models/furniture.dart';
import 'product_grid_element.dart';


class ProductGrid extends StatelessWidget {
  final furnitures;
  final Function update;

  ProductGrid({this.furnitures, this.update});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: furnitures.length,
      itemBuilder: (BuildContext context, int index) {
        final furniture = Furniture.fromJson(furnitures[index]);

        return ProductGridElement(
          furniture: furniture,
          update: update,
        );
      },
    );
  }
}