import 'package:flutter/material.dart';

import '../../../domines/entites/ProductEntity.dart';
import 'CustomFrutDisplay/Custom Fruts Display.dart';


class ProductsGridview extends StatelessWidget {
  const ProductsGridview({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CustomFrutDisplay(
            productEntity: products[index],
          );
        });
  }
}
