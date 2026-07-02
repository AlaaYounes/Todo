import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';

class FocusAreaItem extends StatelessWidget {
  const FocusAreaItem({
    super.key,
    required this.label,
    this.isActive = false,
    this.onTap,
  });
  final String label;
  final bool? isActive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isActive! ? AppColors.chipActiveBg : AppColors.chipInactiveBg,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 14.sp,
            fontWeight: isActive! ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
