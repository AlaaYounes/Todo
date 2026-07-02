import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Color(0xFFE8E0DC), thickness: 1.h),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Text(
            "be present",
            style: TextStyle(
              fontSize: 16.sp,
              fontStyle: FontStyle.italic,
              fontFamily: 'Serif',
              color: AppColors.textLight.withOpacity(0.7),
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Color(0xFFE8E0DC), thickness: 1.h),
        ),
      ],
    );
  }
}
