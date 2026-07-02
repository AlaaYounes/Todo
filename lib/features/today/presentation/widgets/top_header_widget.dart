import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "TODAY'S FOCUS",
          style: TextStyle(
            color: Color.fromRGBO(110, 125, 109, 1),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          'Good morning, Alex',
          style: GoogleFonts.literata(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
