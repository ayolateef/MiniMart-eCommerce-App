import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart_project/themes/app_svgs.dart';

import '../themes/text_style.dart';
import '../utils/app_colors.dart';

class ToastWidget extends StatelessWidget {
  final String message;
  static OverlayEntry? _currentEntry;

  const ToastWidget({super.key, required this.message});

  static void show(BuildContext context, String message) {
    _currentEntry?.remove();

    final overlay = Overlay.of(context);

    _currentEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100.h,
        left: 16.w,
        right: 16.w,
        child: Material(
          color: Colors.transparent,
          child: ToastWidget(message: message),
        ),
      ),
    );

    overlay.insert(_currentEntry!);

    Future.delayed(const Duration(seconds: 3), () {
      _currentEntry?.remove();
      _currentEntry = null;
    });
  }

  static void dismiss() {
    _currentEntry?.remove();
    _currentEntry = null;
  }

  @override


  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical:15.h),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppColors.successColor,
            width: MediaQuery.of(context).size.width * 0.02,
          ),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Expanded(
            child: Row(
              children: [
                const SvgWidget(AppSvgs.checkCircle),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyles.aboutItem.copyWith(fontSize: 14.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ToastWidget.dismiss();
                  },
                  child: const SvgWidget(AppSvgs.closeIcon),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
