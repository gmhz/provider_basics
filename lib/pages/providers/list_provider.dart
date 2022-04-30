import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {

  bool _loading = false;


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<String> items = [];

  Future<void> loadItems() async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    items.addAll([
      "Капуста0",
      "Капуста1",
      "Капуста2",
      "Капуста3",
      "Капуста4",
      "Капуста5",
      "Капуста6",
      "Капуста7",
    ]);

    loading = false;
    notifyListeners();
  }
}
