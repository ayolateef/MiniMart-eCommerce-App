import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart_project/themes/app_svgs.dart';
import 'package:provider/provider.dart';
import '../providers/bottom_nav_provider.dart';
import '../providers/cart_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/bottom_nav.dart';
import 'cart_screen.dart';
import 'favourite_screen.dart';
import 'product_list_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNav();
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final screens = [
      const ProductListScreen(),
      const FavoriteScreen(),
      const CartScreen(),
      const Placeholder(),
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: screens[bottomNavProvider.currentIndex],
        backgroundColor: AppColors.background,
        bottomNavigationBar: Container(
          height: 84.h,
          padding: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavColumn(
                icon: AppSvgs.homeIcon,
                isActive: bottomNavProvider.currentIndex == 0,
                labelText: 'Home',
                onPressed: () {
                  bottomNavProvider.setIndex(0);
                },
              ),
              BottomNavColumn(
                icon: AppSvgs.favIcon,
                isActive: bottomNavProvider.currentIndex == 1,
                labelText: 'Favorite',
                onPressed: () {
                  bottomNavProvider.setIndex(1);
                },
              ),
              BottomNavColumn(
                icon: AppSvgs.cartIcon,
                isActive: bottomNavProvider.currentIndex == 2,
                labelText: 'Cart',
                badgeCount: cartProvider.cartItemCount,
                onPressed: () {
                  bottomNavProvider.setIndex(2);
                },
              ),
              BottomNavColumn(
                icon: AppSvgs.profileIcon,
                isActive: bottomNavProvider.currentIndex == 3,
                labelText: 'Profile',
                onPressed: () {
                  bottomNavProvider.setIndex(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}