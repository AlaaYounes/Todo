import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';
import 'package:mindfultodo/core/assets/vectors/vectors.dart';
import 'package:mindfultodo/features/app-layout/presentation/cubit/app_layout_cubit.dart';
import 'package:mindfultodo/features/app-layout/presentation/widgets/build_custom_nav_item.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.cubit});
  final AppLayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BuildCustomNavItem(
            index: 0,
            label: 'Today',
            activeVector: AppVectors.activeTodayVector,
            inactiveVector: AppVectors.inactiveTodayVector,
            cubit: cubit,
          ),
          BuildCustomNavItem(
            index: 1,
            label: 'Calendar',
            activeVector: AppVectors.activeCalenderVector,
            inactiveVector: AppVectors.inactiveCalenderVector,
            cubit: cubit,
          ),
          BuildCustomNavItem(
            index: 2,
            label: 'Create',
            icon: Icons.add,
            cubit: cubit,
          ),
          BuildCustomNavItem(
            index: 3,
            label: 'Library',
            activeVector: AppVectors.activeLibraryVector,
            inactiveVector: AppVectors.inactiveLibraryVector,
            cubit: cubit,
          ),
        ],
      ),
    );
  }
}
