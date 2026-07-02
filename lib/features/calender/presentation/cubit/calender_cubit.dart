import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/features/calender/presentation/cubit/calender_states.dart';
import 'package:mindfultodo/features/today/domain/usecases/get_all_tasks_usecase.dart';

class CalenderCubit extends Cubit<CalenderStates> {
  CalenderCubit() : super(CalenderInitialState());

  static CalenderCubit get(context) => BlocProvider.of(context);
  final _getAllTasksUsecase = sl.get<GetAllTasksUsecase>();

  List<TaskEntity> tasksList = [];
  List<double> weeklyFocusData = [];
  int selectedDayIndex = 0;
  late DateTime startOfWeek;
  late DateTime endOfWeek;
  List<String> weekdays = [];
  final List<String> _dayNames = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  void getSelectedDay(int index) {
    selectedDayIndex = index;
    emit(CalenderGetSelectedDayState());
  }

  Future<void> getAllTasks() async {
    final result = await _getAllTasksUsecase.call();
    tasksList = result;
  }

  void calculateWeeklyFocusData() {
    emit(CalenderLoadingState());
    getAllTasks().then((_) {
      weeklyFocusData.clear();
      weekdays
          .clear(); // Clear weekdays so it doesn't duplicate on multiple calls

      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);

      // Start exactly 6 days ago so that the 7-day loop ends ON 'today'
      DateTime startOfPastSevenDays = today.subtract(const Duration(days: 6));

      // Set the start and end of the week
      startOfWeek = startOfPastSevenDays;
      endOfWeek = startOfWeek.add(const Duration(days: 6));

      for (int i = 0; i < 7; i++) {
        DateTime currentDay = startOfPastSevenDays.add(Duration(days: i));

        // 1. Get the correct day name using the weekday index (1-7, so subtract 1)
        String dayName = _dayNames[currentDay.weekday - 1];
        weekdays.add(dayName);

        double dayTotalDuration = 0;

        for (var task in tasksList) {
          if (task.date != null && task.isCompleted == true) {
            DateTime taskDate = DateTime.parse(task.date!);

            // Check if the task belongs to 'currentDay'
            if (taskDate.year == currentDay.year &&
                taskDate.month == currentDay.month &&
                taskDate.day == currentDay.day) {
              dayTotalDuration += task.duration ?? 0.0;
            }
          }
        }

        // Add this specific day's total to your list
        weeklyFocusData.add(dayTotalDuration);

        log(
          '$dayName (${currentDay.day}/${currentDay.month}) total: $dayTotalDuration',
        );
      }

      emit(CalenderGetWeeklyFocusDataState());
    });
  }
}
