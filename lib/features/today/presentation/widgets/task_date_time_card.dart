import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';

class TaskDateTimeCard extends StatelessWidget {
  const TaskDateTimeCard({super.key, required this.task});
  final TaskEntity task;
  @override
  Widget build(BuildContext context) {
    String rawTime = task.startTime!;
    int hour = int.parse(rawTime.substring(10, 12));
    int minute = int.parse(rawTime.substring(13, 15));
    TimeOfDay restoredTime = TimeOfDay(hour: hour, minute: minute);
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF6EAE6), // Light grey/pink background
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFEADBDA), // Slightly darker for icon bg
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: 20.sp,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATE',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    DateFormat(
                      "EEEE, MMM d",
                    ).format(DateTime.parse(task.date!)),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFEADBDA),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.access_time,
                  size: 20.sp,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restoredTime.format(context),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
