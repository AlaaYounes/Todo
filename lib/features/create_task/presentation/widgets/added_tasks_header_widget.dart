import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddedTasksHeaderWidget extends StatelessWidget {
  const AddedTasksHeaderWidget({super.key, required this.itemCount});
  final String itemCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ADDED TASKS',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          '$itemCount items',
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
