import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/list_provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ListProvider>().loadItems();
  }

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<ListProvider>().loading;
    final items = context.watch<ListProvider>().items;
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: loading
          ? Center(child: CupertinoActivityIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                final item = items.elementAt(index);
                return ListTile(
                  title: Text(item),
                  onTap: () {},
                );
              },
              itemCount: items.length,
            ),
    );
  }
}
