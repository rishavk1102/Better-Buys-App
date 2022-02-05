import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details-screen';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text(product.name!),
        backgroundColor: const Color(0xFF4E8489),
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        // For background color
        color: const Color(0xFF4E8489),
        child: Container(
          // Main container
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Product image
              Image.network(
                "http://whoisrishav.com/pk/better-buys/assets/${product.unCompressedImage!}",
                height: MediaQuery.of(context).size.height * 1 / 2 - 20.0,
                fit: BoxFit.cover,
              ),
              // Product price per kg
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  'Rs. ${product.pricePerKg!} / kg',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF4E8489),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
