import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_items.dart';
import '../models/products.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  final double _shipping = 10.00;
  SharedPreferences? _prefs;

  List<CartItem> get cartItems => _cartItems;
  double get subtotal =>
      _cartItems.fold(0, (sum, item) => sum + item.product.price * item.quantity);
  double get shipping => _shipping;
  double get total => subtotal + shipping;
  int get cartItemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  CartProvider() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    try {
      if (_prefs == null) {
        _prefs = await SharedPreferences.getInstance();
        await _loadCart();
      }
    } catch (e) {
      debugPrint('Error initializing SharedPreferences: $e');
    }
  }

  void addToCart(Product product) {
    final index = _cartItems.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _cartItems[index] = CartItem(
        product: _cartItems[index].product,
        quantity: _cartItems[index].quantity + 1,
      );
    } else {
      _cartItems.add(CartItem(product: product, quantity: 1));
    }
    _saveCart();
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length) {
      if (newQuantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index] = CartItem(
          product: _cartItems[index].product,
          quantity: newQuantity,
        );
      }
      _saveCart();
      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      _saveCart();
      notifyListeners();
    }
  }

  // Save cart to shared preferences
  Future<void> _saveCart() async {
    try {
      if (_prefs == null) {
        await _initPrefs();
      }
      if (_prefs != null) {
        final cartData = _cartItems
            .map((item) => {
          'product': {
            'id': item.product.id,
            'name': item.product.name,
            'price': item.product.price,
            'imageUrl': item.product.imageUrl,
            'description': item.product.description,
            'inStock': item.product.inStock,
          },
          'quantity': item.quantity,
        })
            .toList();
        await _prefs!.setString('cart', json.encode(cartData));
      } else {
        debugPrint('SharedPreferences not initialized');
      }
    } catch (e) {
      debugPrint('Error saving cart: $e');
    }
  }

  // Load cart from shared preferences
  Future<void> _loadCart() async {
    try {
      if (_prefs == null) {
        await _initPrefs();
      }
      if (_prefs != null) {
        final cartString = _prefs!.getString('cart');
        if (cartString != null) {
          final cartData = json.decode(cartString) as List;
          _cartItems = cartData
              .map((item) => CartItem(
            product: Product(
              id: item['product']['id'],
              name: item['product']['name'],
              price: item['product']['price'].toDouble(),
              imageUrl: item['product']['imageUrl'],
              description: item['product']['description'],
              inStock: item['product']['inStock'],
            ),
            quantity: item['quantity'],
          ))
              .toList();
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('Error loading cart: $e');
    }
  }
}