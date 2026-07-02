import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressCircleWidget extends StatelessWidget {
  const ProgressCircleWidget({
    super.key,
    required this.progressPercentage,
    required this.totalItems,
    required this.completedItems,
  });

  final double progressPercentage;
  final int totalItems;
  final int completedItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 85.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        border: Border.all(
          color: Color.fromRGBO(211, 211, 211, 0.5),
          width: 0.5.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularPercentIndicator(
            radius: 65.r,
            lineWidth: 4.w,
            percent: progressPercentage,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${((progressPercentage * 100).toInt()).toString()}%',
                  style: GoogleFonts.literata(fontSize: 25.sp),
                ),
                Text(
                  'Focus',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff54433e),
                  ),
                ),
              ],
            ),
            progressColor: Color(0xff944931),
            backgroundColor: Color.fromRGBO(211, 211, 211, 0.5),
            circularStrokeCap: CircularStrokeCap.square,
            animation: true,
            animationDuration: 500,
          ),
          SizedBox(height: 20.h),
          Text('$completedItems of $totalItems tasks completed'),
        ],
      ),
    );
  }
}
