import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mini_mart_project/themes/app_svgs.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

import '../themes/text_style.dart';
import '../utils/app_colors.dart';
import '../utils/app_router.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    // Filter products based on search query
    final filteredProducts = productProvider.products
        .where((product) => product.name
        .toLowerCase()
        .contains(_searchQuery.toLowerCase()))
        .toList();

    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: SizedBox(
                    height: 46.h,
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Search..',
                        hintStyle: const TextStyle(color: AppColors.lightGrey),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12.0.sp),
                          child: const SvgWidget(AppSvgs.searchIcon),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightGrey.withOpacity(0.1)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      onSubmitted: (value) {
                        _searchFocusNode.unfocus();
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                ),
                8.verticalSpace,
                const Divider(),
                8.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 14.w,
                        color: AppColors.iconColor,
                      ),
                      SizedBox(width: 10.w),
                      Text('Technology', style: AppTextStyles.categoryTitle),
                    ],
                  ),
                ),
                11.verticalSpace,
                const Divider(
                  color: Colors.white10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Wrap(
                    spacing: 15.w,
                    runSpacing: 5.h,
                    children: [
                      Text('Smartphones,', style: AppTextStyles.itemNames),
                      Text('Laptops  &  ', style: AppTextStyles.itemNames),
                      Text('Accessories', style: AppTextStyles.itemNames),
                    ],
                  ),
                ),
                filteredProducts.isEmpty
                    ? Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Center(
                    child: Text(
                      'No item found',
                      style: AppTextStyles.categoryTitle.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.lightGrey,
                      ),
                    ),
                  ),
                )
                    : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
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
      ),
    );
  }
}
