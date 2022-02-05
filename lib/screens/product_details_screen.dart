import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details-screen';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
        backgroundColor: const Color(0xFF4E8489),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            "http://whoisrishav.com/pk/better-buys/assets/${product.image!}",
            height: MediaQuery.of(context).size.height * 1/2,
            fit: BoxFit.cover,
          ),
          Text('${product.pricePerKg!}')
        ],
      ),
    );
  }
}
