import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';
import 'package:mindfultodo/features/today/presentation/widgets/task_action_buttons.dart';
import 'package:mindfultodo/features/today/presentation/widgets/task_date_time_card.dart';
import 'package:mindfultodo/features/today/presentation/widgets/task_description_card.dart';

// --- MAIN SCREEN WIDGET ---

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});
  final TaskEntity task;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        TodayCubit.get(context).getAllTasks();
      },
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.sp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Task Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text(
                task.title!,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF3E2723),
                  height: 1.2.h,
                ),
              ),
              SizedBox(height: 20.h),
              TaskDescriptionCard(task: task),
              SizedBox(height: 15.h),
              TaskDateTimeCard(task: task),
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              TaskActionButtons(task: task),
            ],
          ),
        ),
      ),
    );
  }
}
