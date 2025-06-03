import 'package:flutter/material.dart';
import '../models/products.dart';

import '../data/sample_data.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products;

  ProductProvider() : _products = SampleData.products;

  List<Product> get products => List.unmodifiable(_products);

  Product getProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }
}