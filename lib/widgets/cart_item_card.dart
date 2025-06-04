import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart_project/themes/app_images.dart';
import 'package:mini_mart_project/themes/app_svgs.dart';
import 'package:provider/provider.dart';

import '../models/cart_items.dart';
import '../providers/cart_provider.dart';
import '../themes/text_style.dart';
import '../utils/app_colors.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final int index;

  const CartItemCard({super.key, required this.cartItem, required this.index});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final displayName = cartItem.product.name.replaceAll('\n', ' ');

    return Card(
      elevation: 0.1,
      color: AppColors.cardGreyColor,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            imageHelper(
              cartItem.product.imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: AppTextStyles.productName,

                    // overflow: TextOverflow.ellipsis,
                  ),
                  5.verticalSpace,
                  Text(
                    '\$${cartItem.product.price.toStringAsFixed(2)}',
                    style: AppTextStyles.productPrice,
                  ),
                  5.verticalSpace,
                  Text(
                    cartItem.product.inStock ? 'In Stock' : 'Out of Stock',
                    style: TextStyle(
                      color: cartItem.product.inStock ? AppColors.successColor: Colors.red,
                      fontSize: 12.sp,
                    ),
                  ),
                  5.verticalSpace,


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(

                        decoration: const BoxDecoration(
                          color: AppColors.circleGreyColor,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          onTap: (){
                            cartProvider.updateQuantity(index, cartItem.quantity - 1);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SvgWidget(AppSvgs.minus),
                          )
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text('${cartItem.quantity}', style: AppTextStyles.addressText),
                      SizedBox(width: 8.w),


                      Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.circleGreyColor),
                        ),
                        child: InkWell(
                            onTap: (){
                              cartProvider.updateQuantity(index, cartItem.quantity + 1);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: SvgWidget(AppSvgs.plus),
                            )
                        ),
                      ),
                      SizedBox(width: 8.w),

                      // Delete Icon with white background and light grey border
                      Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.circleGreyColor,),
                        ),
                        child: InkWell(
                          onTap: () {
                            cartProvider.removeFromCart(index);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SvgWidget(
                              AppSvgs.deleteIcon
                            ),
                          )
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}