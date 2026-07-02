import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.onPressed,
  });
  final String taskTitle;
  final String taskDescription;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffd3d3d3), width: 0.5.w),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Color(0xfff7ede5),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Icon(Icons.task, size: 30.sp, color: Color(0xff944931)),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  taskDescription,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.edit, size: 25.sp, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
