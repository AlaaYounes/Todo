import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';
import 'package:mindfultodo/features/today/presentation/pages/task_details_screen.dart';
import 'package:mindfultodo/features/today/presentation/widgets/category_widget.dart';
import 'package:mindfultodo/features/today/presentation/widgets/task_item_card.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key, required this.cubit});
  final TodayCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryWidget(
          remainingCount: cubit.shoppingTasksList.where((e) => !e.isCompleted!).length,
          categryName: 'Shopping',
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cubit.shoppingTasksList.length,
          itemBuilder: (context, index) {
            final task = cubit.shoppingTasksList[index];
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
