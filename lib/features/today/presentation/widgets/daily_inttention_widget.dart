import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyInttentionWidget extends StatelessWidget {
  const DailyInttentionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 243, 238, 0.6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Color.fromRGBO(211, 211, 211, 0.5),
          width: 0.5.w,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.flare_rounded,
                size: 18.sp,
                color: Color.fromRGBO(148, 73, 49, 1),
              ),
              SizedBox(width: 10.w),
              Text(
                'DAILY INTENTION',
                style: TextStyle(
                  color: Color.fromRGBO(84, 67, 62, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Spacer(),
              Icon(
                Icons.edit_outlined,
                color: Color.fromRGBO(148, 73, 49, 1),
                size: 20.r,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '"I will move through today with clarity and prioritize my well-being while achieving my creative goals."',
            style: GoogleFonts.merriweather(
              // Or GoogleFonts.merriweather
              fontSize: 18.sp,
              letterSpacing: 1.3.w,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: const Color(
                0xFF1E1B1A,
              ), // Use your dark onSurface text color
              height: 1.5.h, // Increases the space between lines
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Container(
                width: 6.w, // Controls the exact size of the circle
                height: 6.h,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(110, 125, 109, 1),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Refined by Mindful AI',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(110, 125, 109, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
