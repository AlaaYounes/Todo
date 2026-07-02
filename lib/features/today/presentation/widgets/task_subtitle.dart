import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskSubtitle extends StatelessWidget {
  final String description;
  final String time;
  final bool isCompleted;

  const TaskSubtitle({
    super.key,
    required this.description,
    required this.time,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: isCompleted
                    ? const Color.fromRGBO(120, 120, 120, 0.6)
                    : null,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (isCompleted && time.isNotEmpty) ...[
          SizedBox(width: 10.w),
          Text(
            TimeOfDay.now().format(context),
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ],
    );
  }
}
