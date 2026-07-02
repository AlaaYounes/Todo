import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FocusBarWidget extends StatelessWidget {
  final String dayName;
  final double focusValue;
  final double hieghestValue;
  final double maxHeight;
  final bool isSelected;

  const FocusBarWidget({
    required this.dayName,
    required this.focusValue,
    required this.isSelected,
    required this.hieghestValue,
    required this.maxHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double barHeight;
    if (hieghestValue == 0) {
      barHeight = 0.h;
    } else {
      barHeight = ((focusValue / hieghestValue) * maxHeight).h;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            color: !isSelected
                ? Color.fromRGBO(228, 235, 228, 1)
                : Color.fromRGBO(206, 126, 96, 1),
          ),
          width: 25.w,
          height: barHeight,
        ),
        SizedBox(height: 9.h),
        Text(dayName),
      ],
    );
  }
}
