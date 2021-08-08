import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      children: [
        // image section
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Stack(
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: primaryColors[productIndex % 4],
                    width: 3.0,
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(5.0),
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
                child: Image.network(
                    "http://whoisrishav.com/pk/better-buys/assets/${product.image!}"),
              ),
            ],
          ),
        ),

        // product name
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            product.name!,
            style: GoogleFonts.poppins(
              color: const Color(0xFF4E8489),
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
