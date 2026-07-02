import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_cubit.dart';

class WeeklyReviewHeader extends StatelessWidget {
  const WeeklyReviewHeader({super.key, required this.calenderCubit});

  final CalenderCubit calenderCubit;
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
          Text(
            '${DateFormat('MMMM dd').format(calenderCubit.startOfWeek)} => ${DateFormat('MMMM dd').format(calenderCubit.endOfWeek)}',
            style: TextStyle(color: Color.fromRGBO(84, 67, 62, 1)),
          ),
        ],
      ),
    );
  }
}
