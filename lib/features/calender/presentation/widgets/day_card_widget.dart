import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DayCard extends StatefulWidget {
  final String dayName;
  final String dayNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const DayCard({
    required this.dayName,
    required this.dayNumber,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 70.w,
        margin: EdgeInsets.all(10.w),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5.w,
            color: Color.fromRGBO(236, 229, 223, 1),
          ),
          borderRadius: BorderRadius.circular(15.r),
          color: widget.isSelected
              ? Color.fromRGBO(214, 125, 97, 1.0)
              : Color.fromRGBO(245, 243, 238, 1.0),
        ),
        child: widget.isSelected
            ? Column(
                children: [
                  Text(
                    widget.dayName,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Color.fromRGBO(106, 60, 44, 1),
                    ),
                  ),
                  Text(
                    widget.dayNumber,
                    style: GoogleFonts.literata(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Color.fromRGBO(68, 25, 15, 1),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(68, 25, 15, 1),
                    ),
                    width: 6.w,
                    height: 6.h,
                  ),
                ],
              )
            : Column(
                children: [
                  Text(widget.dayName, style: TextStyle(fontSize: 13.sp)),
                  Text(
                    widget.dayNumber,
                    style: GoogleFonts.literata(fontSize: 16.sp),
                  ),
                ],
              ),
      ),
    );
  }
}
