import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/create_task/presentation/pages/new_task_screen.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewTaskScreen()),
        );
      },
      borderRadius: BorderRadius.circular(10.r),
      child: DottedBorder(
        color: const Color(0xFFD5C4BC),
        strokeWidth: 2.w,
        dashPattern: const [10, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: const Color(0xFF5A4A42), size: 20.sp),
              SizedBox(width: 4.w),
              Text(
                "ADD ANOTHER TASK",
                style: TextStyle(
                  color: const Color(0xFF5A4A42),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
