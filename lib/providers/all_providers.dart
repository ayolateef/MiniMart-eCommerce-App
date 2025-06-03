
import 'package:provider/provider.dart';
import 'bottom_nav_provider.dart';
import 'cart_provider.dart';
import 'favorite_provider..dart';
import 'product_provider.dart';
import 'package:provider/single_child_widget.dart';


final List<SingleChildWidget> allProviders = [
  ChangeNotifierProvider(create: (_) => ProductProvider()),
  ChangeNotifierProvider(create: (_) => CartProvider()),
  ChangeNotifierProvider(create: (_) => BottomNavProvider()),
  ChangeNotifierProvider(create: (_) => FavoriteProvider()),
];
