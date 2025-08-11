import 'package:account_login/models/food_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCart extends StateNotifier<Map<FoodItem, int>> {
  ShoppingCart() : super({});

  void addItem(FoodItem item, int quantity) {
    if (quantity <= 0) return; // Don't add negative/zero quantities

    state = {...state, item: (state[item] ?? 0) + quantity};
  }

  void removeItem(FoodItem item) {
    final newState = Map<FoodItem, int>.from(state);
    newState.remove(item);
    state = newState;
  }

  void clearCart() {
    state = {};
  }
}
