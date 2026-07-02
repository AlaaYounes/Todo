import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.remainingCount,
    required this.categryName,
  });
  final int remainingCount;
  final String categryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(categryName, style: GoogleFonts.literata(fontSize: 20.sp)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: Color.fromRGBO(206, 224, 202, 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: remainingCount == 0
                ? null
                : Text(
                    remainingCount >= 2
                        ? '$remainingCount Remainders'
                        : '1 Remainder',
                  ),
          ),
        ],
      ),
    );
  }
}
