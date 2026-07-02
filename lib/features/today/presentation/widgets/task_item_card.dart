import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';
import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/features/today/presentation/widgets/task_subtitle.dart';

class TaskItemCard extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback onTap; // Changed from ValueChanged<bool?> to VoidCallback

  const TaskItemCard({super.key, required this.task, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = task.isCompleted ?? false;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(right: 18.w, left: 18.w, bottom: 18.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          if (!isCompleted)
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10.r,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Material(
        animationDuration: const Duration(milliseconds: 300),
        color: isCompleted
            ? AppColors.completedBgColor
            : AppColors.uncompletedBgColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: isCompleted
                ? AppColors.completedBorderColor
                : AppColors.uncompletedBorderColor,
            width: 1.2.w,
          ),
        ),
        child: InkWell(
          onTap: onTap, // Triggers navigation or whatever action you pass in
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
              // Replaces the checkbox visually while remaining static on this screen
              leading: Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted
                    ? const Color(0xFF43A047)
                    : Colors.grey.shade400,
                size: 24.sp,
              ),
              title: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: isCompleted ? FontWeight.w500 : FontWeight.w600,
                  color: isCompleted
                      ? AppColors.completedTextColor
                      : const Color(0xFF2C2C2C),
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: AppColors.completedTextColor,
                ),
                child: Text(task.title ?? ''),
              ),
              subtitle: (task.description == null || task.description!.isEmpty)
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: TaskSubtitle(
                        description: task.description!,
                        time: task.startTime ?? '',
                        isCompleted: isCompleted,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
