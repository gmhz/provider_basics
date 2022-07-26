import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home2_screen.dart';

class Good1Page extends StatelessWidget {
  const Good1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(child: Text("Cart: ${cartProvider.itemsCount}")),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Good 1 page"),
            TextButton(
              onPressed: () {
                final cartProvider = context.read<CartProvider>();
                cartProvider.itemsCount = cartProvider.itemsCount + 1;
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}

class Good2Page extends StatelessWidget {
  const Good2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(child: Text("Cart: ${cartProvider.itemsCount}")),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Good 2 page"),
            TextButton(
              onPressed: () {
                final cartProvider = context.read<CartProvider>();
                cartProvider.itemsCount = cartProvider.itemsCount + 1;
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
