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
        ],
      ),
    );
  }
}
