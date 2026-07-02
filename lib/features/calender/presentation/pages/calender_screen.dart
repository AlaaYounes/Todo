import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_cubit.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_states.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/focus_level_chart_widget.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/weekly_day_selector_widget.dart';
import 'package:mindfultodo/features/calender/presentation/widgets/weekly_review_header.dart';
import 'package:mindfultodo/features/today/presentation/widgets/progress_circle_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 248, 243, 1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromRGBO(243, 237, 234, 1),
                        ),
                      ),
                      padding: EdgeInsets.all(13.w),
                      margin: EdgeInsets.all(13.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'TASK COMPLETION',
                                style: TextStyle(
                                  color: Color.fromRGBO(105, 128, 109, 1),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          ProgressCircleWidget(
                            progressPercentage: cubit.tasksList.isEmpty
                                ? 0.0
                                : cubit.tasksList
                                          .where((e) => e.isCompleted!)
                                          .length /
                                      cubit.tasksList.length,
                            totalItems: cubit.tasksList.length,
                            completedItems: cubit.tasksList
                                .where((e) => e.isCompleted!)
                                .length,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text('Completed'),
                              Spacer(),
                              Text(
                                '${cubit.completedItems}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Remaining'),
                              Spacer(),
                              Text(
                                '${cubit.remainingItems}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
