import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';

class TaskTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isTitle;
  final TextEditingController controller;
  final int? maxLines;

  const TaskTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isTitle, required this.controller, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5.w,
            color: Color(0xFF908075),
          ),
        ),
        TextField(
          controller: controller,
          style: TextStyle(
            fontSize: isTitle ? 22.sp : 16.sp,
            color: AppColors.textDark,
            fontFamily: isTitle ? 'Serif' : 'Sans',
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: isTitle ? 22.sp : 16.sp,
              color: AppColors.textLight,
              fontFamily: isTitle ? 'Serif' : 'Sans',
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E0DC), width: 1.w),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.buttonColor,
                width: 1.5.w,
              ),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 12.w),
          ),
          maxLines: isTitle ? 1 : maxLines,
        ),
      ],
    );
  }
}
