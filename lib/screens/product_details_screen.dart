import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart_project/themes/app_images.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import '../providers/bottom_nav_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider..dart';

import '../themes/app_svgs.dart';
import '../themes/text_style.dart';
import '../utils/app_colors.dart';

import '../widgets/button.dart';
import '../widgets/toast_widget.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    final displayName = product.name.replaceAll('\n', ' ');
    final descriptionSentences = product.description
        .split('\n')
        .map((sentence) => sentence.trim())
        .where((sentence) => sentence.isNotEmpty)
        .toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18.w),
                      SizedBox(width: 8.w),
                      Text(
                        'GO Back',
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
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 331.90.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: imageHelper(
                              product.imageUrl,
                              height: 331.90.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8.h,
                          right: 8.w,
                          child: GestureDetector(
                            onTap: () {
                              favoriteProvider.toggleFavorite(product.id);
                              ToastWidget.show(
                                context,
                                favoriteProvider.isFavorite(product.id)
                                    ? 'Added to favorites'
                                    : 'Removed from favorites',
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                favoriteProvider.isFavorite(product.id)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 24.w,
                                color: favoriteProvider.isFavorite(product.id)
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      displayName,
                      style: AppTextStyles.itemNameDetail
                          .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w300),
                    ),
                    10.verticalSpace,
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.productPrice.copyWith(fontSize: 33.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'About this item',
                      style: AppTextStyles.aboutItem
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: descriptionSentences.map((sentence) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: AppTextStyles.aboutItem,
                              ),
                              Expanded(
                                child: Text(
                                  sentence,
                                  style: AppTextStyles.aboutItem,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16.h),
                    CustomButton(
                      text: 'Add to Cart',
                      onPressed: () {
                        cartProvider.addToCart(product);
                        ToastWidget.show(context, 'Item has been added to cart');
                        Future.delayed(const Duration(seconds: 2), () {
                          if (context.mounted) {
                            Provider.of<BottomNavProvider>(context, listen: false)
                                .setIndex(1);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}