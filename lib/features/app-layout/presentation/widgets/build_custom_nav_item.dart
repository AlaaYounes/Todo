import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';

class BuildCustomNavItem extends StatelessWidget {
    const BuildCustomNavItem({
    super.key,
    required this.index,
    required this.label,
    this.activeVector,
    this.inactiveVector,
    this.cubit,
    this.icon,
  });
  final int index;
  final String label;
  final dynamic cubit;
  final String? activeVector;
  final String? inactiveVector;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final bool isSelected = cubit.currentIndex == index;
    return GestureDetector(
      onTap: () => cubit.changeTab(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: isSelected
                        ? AppColors.bottomNavIconActive
                        : AppColors.bottomNavIconInactive,
                    size: 24.sp,
                  )
                : SvgPicture.asset(
                    isSelected ? activeVector! : inactiveVector!,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? AppColors.bottomNavIconActive
                          : AppColors.bottomNavIconInactive,
                      BlendMode.srcIn,
                    ),
                    width: 24.w,
                    height: 24.h,
                  ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected
                    ? AppColors.bottomNavIconActive
                    : AppColors.bottomNavIconInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
