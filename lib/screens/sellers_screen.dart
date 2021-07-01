import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/seller.dart';

import '../widgets/seller_item.dart';

class SellersScreen extends StatefulWidget {
  static const routeName = '/sellers-screen';

  const SellersScreen({Key? key}) : super(key: key);

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {
  List<Color> sellerItemsBackgroundColor = [];

  @override
  void initState() {
    super.initState();

    sellerItemsBackgroundColor.add(const Color(0xFFE6F3EC));
    sellerItemsBackgroundColor.add(const Color(0xFFE6E6F2));
    sellerItemsBackgroundColor.add(const Color(0xFFE4EDF4));
    sellerItemsBackgroundColor.add(const Color(0xFFE4DAD9));
  }

  @override
  Widget build(BuildContext context) {
    List<Seller> sellers =
        ModalRoute.of(context)!.settings.arguments as List<Seller>;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
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

              // List of sellers
              Column(
                children: sellers
                    .map((e) => SellerItem(
                          seller: e,
                          backgroundColor: sellerItemsBackgroundColor[
                              sellers.indexOf(e) % 4],
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
