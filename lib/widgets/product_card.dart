import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/products.dart';
import '../screens/product_details_screen.dart';
import '../themes/app_images.dart';
import '../themes/text_style.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Split name at \n for ProductListScreen
    final nameParts = product.name.split('\n');
    final mainName = nameParts[0];
    final subName = nameParts.length > 1 ? nameParts[1] : '';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0.1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: SizedBox(
              height: 150.h,
              child: imageHelper(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainName,
                  style: AppTextStyles.productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subName.isNotEmpty)
                  Text(
                    subName,
                    style: AppTextStyles.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                SizedBox(height: 2.h),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.productPrice,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}