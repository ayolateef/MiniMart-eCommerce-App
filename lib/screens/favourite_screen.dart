import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import '../providers/favorite_provider..dart';
import '../providers/product_provider.dart';
import '../themes/app_svgs.dart';
import '../themes/text_style.dart';
import '../utils/app_colors.dart';
import '../utils/app_router.dart';
import '../widgets/product_card.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteProducts = productProvider.products
        .where((product) => favoriteProvider.isFavorite(product.id))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: favoriteProducts.isEmpty
            ? Center(
          child: Text(
            'No favorite items',
            style: AppTextStyles.addressText.copyWith(fontSize: 18.sp),
          ),
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 16.h),
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
                padding: EdgeInsets.symmetric(
                    horizontal: 16.w, vertical: 8.h),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutePath.homeScreen),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18.w),
                      SizedBox(width: 8.w),
                      Text(
                        'Favorites',
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate:
                 SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5.0.w,
                  mainAxisSpacing: 10.h,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePath.productDetailScreen,
                        arguments: product,
                      );
                    },
                    child: ProductCard(product: product),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}