import 'package:flutter/material.dart';
import '../models/products.dart';
import '../screens/favourite_screen.dart';
import '../screens/home_page.dart';
import '../screens/product_details_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutePath.favoriteScreen:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case RoutePath.productDetailScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class RoutePath {
  static const String homeScreen = '/home';
  static const String cartScreen = '/cart';
  static const String productDetailScreen = '/product_detail';
  static const String favoriteScreen = '/favorites';
}