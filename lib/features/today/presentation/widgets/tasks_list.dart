import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_states.dart';
import 'package:mindfultodo/features/today/presentation/widgets/entertainment_list.dart';
import 'package:mindfultodo/features/today/presentation/widgets/other_list.dart';
import 'package:mindfultodo/features/today/presentation/widgets/shopping_list.dart';
import 'package:mindfultodo/features/today/presentation/widgets/sports_list.dart';
import 'package:mindfultodo/features/today/presentation/widgets/study_list.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  void initState() {
    super.initState();
    TodayCubit.get(context).getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = TodayCubit.get(context);
    return BlocBuilder<TodayCubit, TodayStates>(
      builder: (context, state) {
        if (state is TodayLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            SizedBox(height: 10.h),
            if (cubit.tasksList.isEmpty)
              Center(child: Text('No tasks added yet.')),
            if (cubit.entertainmentTasksList.isNotEmpty)
              EntertainmentList(cubit: cubit),
            if (cubit.shoppingTasksList.isNotEmpty) ShoppingList(cubit: cubit),
            if (cubit.sportsTasksList.isNotEmpty) SportsList(cubit: cubit),
            if (cubit.studyTasksList.isNotEmpty) StudyList(cubit: cubit),
            if (cubit.otherTasksList.isNotEmpty) OtherList(cubit: cubit),
          ],
        );
      },
    );
  }
}
