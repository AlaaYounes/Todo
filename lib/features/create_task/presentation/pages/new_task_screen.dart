import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mindfultodo/core/assets/colors/colors.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_state.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/add_focus_area_button.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/bottom_submit_button.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/custom_app_bar_widget.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/date_time_picker.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/divider_section.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/focus_area_item.dart';
import 'package:mindfultodo/features/create_task/presentation/widgets/task_text_field_widget.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = TaskCubit.get(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 16.0.h),
        child: BlocConsumer<TaskCubit, TaskStates>(
          listener: (context, state) {
            if (state is AddTaskErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is AddTaskSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskTextField(
                  label: "TITLE",
                  hintText: "Give your task a name",
                  isTitle: true,
                  controller: cubit.titleController,
                ),
                SizedBox(height: 32.h),
                TaskTextField(
                  label: "DESCRIPTION",
                  hintText: "Add more details...",
                  isTitle: false,
                  controller: cubit.descriptionController,
                  maxLines: null,
                ),
                SizedBox(height: 32.h),
                Visibility(
                  visible: cubit.isFocusAreaVisible == false,
                  child: Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: [
                      FocusAreaItem(
                        label: 'Sports',
                        isActive: cubit.focusArea == 'Sports',
                        onTap: () {
                          cubit.selectFocusArea('Sports');
                        },
                      ),
                      FocusAreaItem(
                        label: 'Entertainment',
                        isActive: cubit.focusArea == 'Entertainment',
                        onTap: () {
                          cubit.selectFocusArea('Entertainment');
                        },
                      ),
                      FocusAreaItem(
                        label: 'Study',
                        isActive: cubit.focusArea == 'Study',
                        onTap: () {
                          cubit.selectFocusArea('Study');
                        },
                      ),
                      FocusAreaItem(
                        label: 'Shopping',
                        isActive: cubit.focusArea == 'Shopping',
                        onTap: () {
                          cubit.selectFocusArea('Shopping');
                        },
                      ),
                      AddFocusAreaButton(
                        onTap: () {
                          cubit.toggleFocusAreaVisibility();
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: cubit.isFocusAreaVisible,
                  child: TaskTextField(
                    label: "FOCUS AREA",
                    hintText: "What will you focus on?",
                    isTitle: false,
                    maxLines: 1,
                    controller: cubit.categoryController,
                  ),
                ),
                // const FocusAreaSection(),
                SizedBox(height: 32.h),
                DateTimePicker(
                  label: "DATE",
                  icon: Icons.calendar_today_outlined,
                  value: cubit.selectedDate == null
                      ? "Select Date"
                      : DateFormat("yyyy-MM-dd").format(cubit.selectedDate!),
                  onTap: () async {
                    DateTime? chosenDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse("2100-12-31"),
                    );
                    if (chosenDate != null) {
                      cubit.changeDate(chosenDate);
                    }
                  },
                ),
                SizedBox(height: 24.h),
                DateTimePicker(
                  label: "TIME",
                  icon: Icons.access_time,
                  value: cubit.selectedTime == null
                      ? "Select Date"
                      : cubit.selectedTime!.format(context),
                  onTap: () async {
                    TimeOfDay? chosenTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (chosenTime != null) {
                      cubit.selectTime(chosenTime);
                    }
                  },
                ),

                SizedBox(height: 48.h),

                const DividerSection(),
                SizedBox(height: 48.h),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomSubmitButton(
        onPressed: () {
          cubit.addTask();
        },
      ),
    );
  }
}
