import 'package:account_login/models/cart_item.dart';
import 'package:account_login/models/food_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingCartProvider =
    StateNotifierProvider<ShoppingCart, List<CartItem>>((ref) {
      return ShoppingCart();
    });

class ShoppingCart extends StateNotifier<List<CartItem>> {
  ShoppingCart() : super([]);

  void addItem(FoodItem item, int quantity) {
    if (quantity <= 0) return; // Don't add negative/zero quantities

    state = [...state, CartItem(foodItem: item, quantity: quantity)];
  }

  void removeItem(FoodItem item) {
    state = state.where((cartItem) => cartItem.foodItem != item).toList();
  }

  void clearCart() {
    state = [];
  }
}
