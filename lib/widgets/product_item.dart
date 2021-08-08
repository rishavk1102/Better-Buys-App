import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utility/colors.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final int productIndex;

  const ProductItem(
      {Key? key, required this.product, required this.productIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            primaryColors[productIndex % 4],
            primaryColors[productIndex % 4].withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
