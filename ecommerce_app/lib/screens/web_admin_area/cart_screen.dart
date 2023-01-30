import 'package:ecommerce_app/utitlies/style.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const String id = "cart";

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Cart",
      style: BoldStyle.boldStyle,
    ));
  }
}
