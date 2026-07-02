import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_cubit.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/focus_bar_widget.dart';

class FocusLevelChart extends StatelessWidget {
  final List<double> weeklyFocusData;
  final int selectedIndex;
  final CalenderCubit calenderCubit;
  const FocusLevelChart({
    super.key,
    required this.weeklyFocusData,
    required this.selectedIndex,
    required this.calenderCubit,
  });

  @override
  Widget build(BuildContext context) {
    double maxValue = calenderCubit.weeklyFocusData.reduce(
      (a, b) => a > b ? a : b,
    );

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
                "${calenderCubit.weeklyFocusData[selectedIndex].toStringAsFixed(1)}h/day",
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
                  dayName: calenderCubit.weekdays[index],
                  focusValue: calenderCubit.weeklyFocusData[index],
                  hieghestValue: maxValue,
                  maxHeight: 120.h,
                  isSelected: calenderCubit.selectedDayIndex == index,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
