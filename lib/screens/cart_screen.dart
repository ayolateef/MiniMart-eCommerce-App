import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_provider.dart';
import '../providers/cart_provider.dart';

import '../themes/app_svgs.dart';
import '../themes/text_style.dart';
import '../utils/app_colors.dart';
import '../utils/app_router.dart';
import '../widgets/button.dart';
import '../widgets/cart_item_card.dart';



class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.cartItems.isEmpty
        ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your cart is empty',
            style: AppTextStyles.addressText.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: 'Shop Now',
              onPressed: () {
                Provider.of<BottomNavProvider>(context, listen: false)
                    .setIndex(0);
              },
            ),
          ),
        ],
      ),
    )
        : SafeArea(
      child: Column(
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DottedBorder(
                  dashPattern: const [4, 2],
                  color: AppColors.blueText,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(5),
                  strokeWidth: 1,
                  child: Container(
                    color: AppColors.primary,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Full Logo",
                      style: AppTextStyles.addressText.copyWith(
                        color: AppColors.blueText,
                        fontWeight: FontWeight.w700,
                        fontSize: 11.sp,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('DELIVERY ADDRESS',
                        style: AppTextStyles.addressText
                            .copyWith(fontSize: 10.sp)),
                    5.verticalSpace,
                    Text('Umuezike Road, Oyo State',
                        style: AppTextStyles.addressText),
                  ],
                ),
                const SvgWidget(AppSvgs.notificationIcon),
              ],
            ),
          ),
          Divider(
            color: AppColors.lightGrey.withOpacity(0.4),
            thickness: 1.h,
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: GestureDetector(
    onTap: () {
    if (Navigator.canPop(context)) {
    Navigator.pop(context);
    } else {
    Navigator.pushReplacementNamed(context, RoutePath.homeScreen);
    Provider.of<BottomNavProvider>(context, listen: false).setIndex(0);
    }
    },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 14.w,
                    color: AppColors.iconColor,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Your Cart',
                    style: AppTextStyles.addressText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.lightGrey.withOpacity(0.2),
            thickness: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return CartItemCard(cartItem: cartItem, index: index);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Info', style: AppTextStyles.categoryTitle),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal', style: AppTextStyles.addressText),
                    Text(
                      '\$${cartProvider.subtotal.toStringAsFixed(2)}',
                      style: AppTextStyles.addressText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping', style: AppTextStyles.addressText),
                    Text(
                      '\$${cartProvider.shipping.toStringAsFixed(2)}',
                      style: AppTextStyles.addressText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: AppTextStyles.productPrice),
                    Text(
                      '\$${cartProvider.total.toStringAsFixed(2)}',
                      style: AppTextStyles.productPrice,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  text:
                  'Checkout (\$${cartProvider.total.toStringAsFixed(2)})',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Proceeding to checkout'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}