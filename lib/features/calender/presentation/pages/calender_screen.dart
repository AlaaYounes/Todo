import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_cubit.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_states.dart';
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
  initState() {
    super.initState();
    var cubit = CalenderCubit.get(context);
    cubit.calculateWeeklyFocusData();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = CalenderCubit.get(context);

    return BlocBuilder<CalenderCubit, CalenderStates>(
      builder: (context, state) {
        return state is CalenderLoadingState
            ? const Center(child: CircularProgressIndicator())
            : cubit.weeklyFocusData.isEmpty
            ? const Center(child: Text('No data available for this week.'))
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: WeeklyReviewHeader(calenderCubit: cubit),
                  ),
                  SliverToBoxAdapter(
                    child: WeeklyDaySelector(
                      selectedIndex: cubit.selectedDayIndex,
                      onTap: (index) {
                        cubit.getSelectedDay(index);
                      },
                      calenderCubit: CalenderCubit.get(context),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FocusLevelChart(
                      weeklyFocusData: cubit.weeklyFocusData,
                      selectedIndex: cubit.selectedDayIndex,
                      calenderCubit: cubit,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
