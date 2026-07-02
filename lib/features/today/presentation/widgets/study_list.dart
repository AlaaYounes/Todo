import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';
import 'package:mindfultodo/features/today/presentation/pages/task_details_screen.dart';
import 'package:mindfultodo/features/today/presentation/widgets/category_widget.dart';
import 'package:mindfultodo/features/today/presentation/widgets/task_item_card.dart';

class StudyList extends StatelessWidget {
  const StudyList({super.key, required this.cubit});
  final TodayCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryWidget(
          remainingCount: cubit.studyTasksList.where((e) => !e.isCompleted!).length,
          categryName: 'Study',
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.studyTasksList.length,
          itemBuilder: (context, index) {
            final task = cubit.studyTasksList[index];
            return TaskItemCard(
              task: task,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TaskDetailsScreen(
                    task: task,
                  ),
                ));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10.h);
          },
        ),
      ],
    );
  }
}
