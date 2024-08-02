import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/cart_item_model.dart';

final cartViewModelProvider = ChangeNotifierProvider<CartViewModel>((ref) {
  return CartViewModel();
});

class CartViewModel extends ChangeNotifier {
  List<CartItem> _items = [
    CartItem(
      id: '1',
      name: 'Apple',
      imageUrl: 'https://via.placeholder.com/80',
      quantity: "0",
      price: 3.99,
    ),
    CartItem(
      id: '2',
      name: 'Banana',
      imageUrl: 'https://via.placeholder.com/80',
      quantity: "1",
      price: 1.99,
    ),
  ];

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(0, (sum, item) => sum + (item.price * int.parse(item.quantity)));

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      _items[index] = CartItem(
        id: _items[index].id,
        name: _items[index].name,
        imageUrl: _items[index].imageUrl,
        quantity: quantity.toString(),
        price: _items[index].price,
      );
      notifyListeners();
    }
  }

  void loadItemsFromJson(List<Map<String, dynamic>> jsonList) {
    _items = jsonList.map((json) => CartItem.fromJson(json)).toList();
    notifyListeners();
  }

  List<Map<String, dynamic>> saveItemsToJson() {
    return _items.map((item) => item.toJson()).toList();
  }
}
