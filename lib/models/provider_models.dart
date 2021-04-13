import 'package:flutter/material.dart';
import 'items.dart';
class ProviderModels with ChangeNotifier {

  bool _checkName = false;
  bool _checkAge = false;
  List<Items> _items = [
    Items(name: 'Nghia', age: 21),
    Items(name: 'A', age: 21),
    Items(name: 'B', age: 21),
    Items(name: 'C', age: 21),
  ];

  List<Items> get items => _items;

  void addItems (Items items) {
    _items.add(items);
    notifyListeners();
  }
  
  void delItems (Items items) {
    _items.remove(items);
    notifyListeners();
  }

  bool get checkName => _checkName;
  bool get checkAge => _checkAge;

  void check (bool value) {
    if (value) {
      _checkName = true;
      _checkAge = true;
    } else {
      _checkName = false;
      _checkAge = false;
    }
    notifyListeners();
  }
}