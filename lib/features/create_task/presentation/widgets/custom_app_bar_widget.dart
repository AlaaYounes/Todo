import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
        child: Row(
          children: [
            IconButton(
              icon:  Icon(Icons.arrow_back, color: AppColors.textDark),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 8.w),
            Center(
              child: Text(
                "New Task",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Serif',
                  color: AppColors.textDark,
                ),
              ),
            ),
            // const Spacer(),
            // Container(
            //   height: 40.h,
            //   width: 40.w,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     gradient: const LinearGradient(
            //       colors: [Color(0xFF8B5A44), Color(0xFF5A3A2C)],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.1),
            //         blurRadius: 4.r,
            //         offset: const Offset(0, 2),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
