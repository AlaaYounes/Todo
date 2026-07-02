import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';

class BottomSubmitButton extends StatelessWidget {
  const BottomSubmitButton({
    super.key,
    required this.onPressed,
    this.isEdit = false,
  });
  final void Function()? onPressed;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
          bottom: 24.h,
          top: 16.h,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 0,
          ),
          child: Text(
            isEdit ? "Update Task" : "Create Task",
            style: TextStyle(
              fontSize: 16.sp,
              color: Color(0xFFD6C8C1),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5.w,
            ),
          ),
        ),
      ),
    );
  }
}
