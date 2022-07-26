import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/pages/good_pages.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({Key? key}) : super(key: key);

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  String str = "123";
  String email = "123";
  String name = "123";
  int count = 123;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        actions:  [
          Center(child: Text("Cart: ${cartProvider.itemsCount}")),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => const Good1Page(),
                ),
              );
            },
            title: const Text("good 1 page"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const Good2Page(),
                ),
              );
            },
            title: const Text("good 2 page"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          setState(() {
            str = "456";
          });
        },
      ),
    );
  }
}

class CartProvider extends ChangeNotifier {
  int _itemsCount = 0;

  int get itemsCount => _itemsCount;

  set itemsCount(int value) {
    _itemsCount = value;
    notifyListeners();
  }
}
