import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_states.dart';
import 'package:mindfultodo/features/today/presentation/widgets/daily_inttention_widget.dart';
import 'package:mindfultodo/features/today/presentation/widgets/progress_circle_widget.dart';
import 'package:mindfultodo/features/today/presentation/widgets/tasks_list.dart';
import 'package:mindfultodo/features/today/presentation/widgets/top_header_widget.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = TodayCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeaderWidget(),
            DailyInttentionWidget(),
            BlocBuilder<TodayCubit, TodayStates>(
              builder: (context, state) {
                return Column(
                  children: [
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
                    TasksList(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
