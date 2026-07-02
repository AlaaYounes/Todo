import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/day_card_widget.dart';

class WeeklyDaySelector extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDaySelected;

  const WeeklyDaySelector({
    super.key,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  @override
  State<WeeklyDaySelector> createState() => _WeeklyDaySelectorState();
}

class _WeeklyDaySelectorState extends State<WeeklyDaySelector> {
  @override
  Widget build(BuildContext context) {
    const List<String> weekdays = [
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
      'SUN',
    ];

    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          DateTime cardDate = DateTime.now().add(Duration(days: index));
          String dayNumber = cardDate.day.toString();
          String dayName = weekdays[cardDate.weekday - 1];
          return DayCard(
            dayName: dayName,
            dayNumber: dayNumber,
            isSelected: widget.selectedIndex == index,
            onTap: () {
              setState(() {
                widget.onDaySelected(index);
              });
              
            },
          );
        }),
      ),
    );
  }
}
