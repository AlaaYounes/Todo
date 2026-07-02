import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/focus_bar_widget.dart';

class FocusLevelChart extends StatelessWidget {
  final List<double> weeklyFocusData;
  final int selectedIndex;

  const FocusLevelChart({
    super.key,
    required this.weeklyFocusData,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    double maxValue = weeklyFocusData.reduce((a, b) => a > b ? a : b);
    if (maxValue == 0) maxValue = 1;
    double weeklyFocusDataSum = weeklyFocusData.fold(
      0,
      (sum, item) => sum + item,
    );
    double averageFocus = weeklyFocusDataSum / weeklyFocusData.length;

    const List<String> singleLetterDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 240, 1),
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: EdgeInsets.all(13.w),
      margin: EdgeInsets.all(13.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('FOCUS LEVEL'),
              Text(
                "${averageFocus.toStringAsFixed(1)}h/day",
              ), // Added toStringAsFixed(1) to avoid long decimals
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 170.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                return FocusBarWidget(
                  dayName: singleLetterDays[index],
                  focusValue: weeklyFocusData[index],
                  hieghestValue:
                      maxValue, // Left as hieghestValue to match your existing FocusBar.dart
                  maxHeight: 120.h,
                  isSelected: selectedIndex == index,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
