import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/seller.dart';
import '../models/product.dart';
import '../server_handler.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product-screen';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];
  bool _productsLoaded = false;
  bool _firstExec = true;

  void getProducts(int sellerId) {
    ServerHandler()
        .getProductsPerSeller(sellerId)
        .then((value) => {
              setState(() {
                _productsLoaded = true;
                products = value;
              })
            })
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    Seller seller = ModalRoute.of(context)!.settings.arguments as Seller;

    if (_firstExec) {
      getProducts(seller.id!);
      _firstExec = false;
    }

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 50.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Better Buys',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 23.0,
                      color: const Color(0xFF4E8489),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // loading section
            if (!_productsLoaded)
              const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4E8489)),
                  strokeWidth: 1.5,
                ),
              ),
            if (!_productsLoaded)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Loading Products',
                  style: GoogleFonts.poppins(),
                ),
              ),

            if (_productsLoaded) Text(products[0].name!),
          ],
        ),
      ),
    );
  }
}
