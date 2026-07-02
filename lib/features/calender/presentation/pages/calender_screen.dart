import 'package:flutter/material.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/focus_level_chart_widget.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/weekly_day_selector_widget.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/weekly_review_header.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 3;
    final List<double> weeklyFocusData = [4.2, 3.0, 20.2, 6.1, 4.5, 2.0, 1.5];
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: WeeklyReviewHeader()),
        SliverToBoxAdapter(
          child: WeeklyDaySelector(
            selectedIndex: selectedIndex,
            onDaySelected: (index) {
              selectedIndex = index;
              setState(() {});
            },
          ),
        ),
        SliverToBoxAdapter(
          child: FocusLevelChart(
            weeklyFocusData: weeklyFocusData,
            selectedIndex: selectedIndex,
          ),
        ),
      ],
    );
  }
}
