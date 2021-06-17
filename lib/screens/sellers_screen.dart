import 'package:flutter/material.dart';

class SellersScreen extends StatelessWidget {
  static const routeName = '/sellers-screen';

  const SellersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Text('Sellers screen'),
    ));
  }
}
