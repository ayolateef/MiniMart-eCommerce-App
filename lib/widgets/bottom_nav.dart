import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart_project/themes/app_svgs.dart';
import '../themes/text_style.dart';
import '../utils/app_colors.dart';

class BottomNavColumn extends StatelessWidget {
  final String icon;
  final bool isActive;
  final String labelText;
  final VoidCallback onPressed;
  final int? badgeCount;

  const BottomNavColumn({
    super.key,
    required this.icon,
    required this.isActive,
    required this.labelText,
    required this.onPressed,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 56.w,
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: SvgWidget(
                  icon,
                  color: isActive ? AppColors.white : Colors.black,
                  // size: 24.w,
                ),
              ),
              if (badgeCount != null && badgeCount! > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: AppColors.countCart,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.h,
                    ),
                    child: Text(
                      '$badgeCount',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          4.verticalSpace,
          Text(
            labelText,
            style: isActive ? AppTextStyles.navSelectedText : AppTextStyles.navText,
          ),
        ],
      ),
    );
  }
}