import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_state.dart';
import 'package:mindfultodo/features/create_task/presentation/pages/new_task_screen.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/add_task_button.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/added_tasks_header_widget.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/create_tasks_top_part_widget.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/task_item_widget.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  initState() {
    super.initState();
    TaskCubit.get(context).getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = TaskCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: BlocBuilder<TaskCubit, TaskStates>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 40.h),
                CreateTasksTopPartWidget(),
                SizedBox(height: 30.h),
                AddedTasksHeaderWidget(
                  itemCount: cubit.tasksList.length.toString(),
                ),
                SizedBox(height: 12.h),
                cubit.tasksList.isEmpty
                    ? Column(
                        children: [
                          Center(
                            child: Text(
                              'You have not added any tasks yet.',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: List.generate(
                          cubit.tasksList.length,
                          (index) => Column(
                            children: [
                              TaskItemWidget(
                                taskTitle: cubit.tasksList[index].title!,
                                taskDescription:
                                    cubit.tasksList[index].description!,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewTaskScreen(
                                        task: cubit.tasksList[index],
                                        isEdit: true,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 12.h),
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: 12.h),
                AddTaskButton(),
              ],
            );
          },
        ),
      ),
    );
  }
}
