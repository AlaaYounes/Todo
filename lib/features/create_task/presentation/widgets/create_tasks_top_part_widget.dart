import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTasksTopPartWidget extends StatelessWidget {
  const CreateTasksTopPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.0.w),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(245, 245, 243, 1),
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: EdgeInsets.all(24.0.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color.fromRGBO(220, 220, 220, 1),
                width: 1.5.w,
              ),
            ),
            child: Icon(
              Icons.fact_check_outlined,
              size: 40.r,
              color: Color.fromRGBO(80, 100, 80, 1),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Confirm Tasks',
          style: GoogleFonts.literata(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        Text(
          'Review the tasks you just added.',
          style: TextStyle(
            color: Color.fromRGBO(94, 78, 72, 1),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
