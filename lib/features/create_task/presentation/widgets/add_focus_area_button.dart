import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFocusAreaButton extends StatelessWidget {
  const AddFocusAreaButton({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        padding: EdgeInsets.all(9.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFC7B8B0), width: 2.w),
        ),
        child: Icon(Icons.add, size: 18.r, color: Color(0xFF908075)),
      ),
    );
  }
}
