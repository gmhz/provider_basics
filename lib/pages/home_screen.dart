import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_screen.dart';
import 'providers/list_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("List"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider(
                    create: (context) => ListProvider(),
                    builder: (context, _) => const ListScreen(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Dialog with provider"),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      ItemDetails(),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("close"),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = context.watch<GoodProvider>().count;
    final totalPrice = context.watch<GoodProvider>().totalPrice;
    return Column(
      children: [
        Text('Min voda'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => context.read<GoodProvider>().decrease(),
              icon: Icon(Icons.exposure_minus_1),
              padding: EdgeInsets.zero,
            ),
            Text('$count'),
            IconButton(
              onPressed: () => context.read<GoodProvider>().increase(),
              icon: Icon(Icons.plus_one),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        Text("$totalPrice"),
      ],
    );
  }
}

class GoodProvider extends ChangeNotifier {
  Good _good = Good();
  int _count = 0;

  int get count => _count;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  double get totalPrice => _good.price * _count;

  void decrease() {
    count = count - 1;
    notifyListeners();
  }

  void increase() {
    count = count + 1;
    notifyListeners();
  }
}

class Good {
  String title = "Good 1";
  double price = 30.3;
}
