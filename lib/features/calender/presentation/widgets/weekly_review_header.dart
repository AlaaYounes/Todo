import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyReviewHeader extends StatelessWidget {
  const WeeklyReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Review',
            style: GoogleFonts.literata(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          const Text(
            'Day 1 => Day 2',
            style: TextStyle(color: Color.fromRGBO(84, 67, 62, 1)),
          ),
        ],
      ),
    );
  }
}
