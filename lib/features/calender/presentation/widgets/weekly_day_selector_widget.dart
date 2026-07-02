import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_cubit.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/day_card_widget.dart';

class WeeklyDaySelector extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;
  final CalenderCubit calenderCubit;

  const WeeklyDaySelector({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.calenderCubit,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          DateTime cardDate = DateTime.now().add(Duration(days: index - 6));
          String dayNumber = cardDate.day.toString();
          String dayName = calenderCubit.weekdays[index];
          return DayCard(
            dayName: dayName,
            dayNumber: dayNumber,
            isSelected: selectedIndex == index,
            onTap: () {
              onTap(index);
            },
          );
        }),
      ),
    );
  }
}
