import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_states.dart';

class TaskActionButtons extends StatelessWidget {
  const TaskActionButtons({super.key, required this.task});

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final cubit = TodayCubit.get(context);
    return BlocListener<TodayCubit, TodayStates>(
      listener: (context, state) {
        if (state is UpdateTaskStatusSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task status updated successfully!'),
              duration: const Duration(seconds: 2),
            ),
          );
          Navigator.of(context).pop();
        }
        if (state is DeleteTaskSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Task deleted successfully!'),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.teal,
            ),
          );
          Navigator.of(context).pop();
        }
      },
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: ElevatedButton(
              onPressed: () {
                cubit.markTaskAsCompleted(task, context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF381E15), // Dark brown
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'MARK AS COMPLETE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Delete Task Button
          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: OutlinedButton(
              onPressed: () {
                cubit.deleteTask(task.id!);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: const Color(0xFFD6C3C0), width: 1.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: const Color(0xFFB54941),
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'DELETE TASK',
                    style: TextStyle(
                      color: const Color(0xFFB54941),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
