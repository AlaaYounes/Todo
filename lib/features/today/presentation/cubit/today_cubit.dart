import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/delete_task_usecase.dart';
import 'package:mindfultodo/features/today/domain/usecases/get_all_tasks_usecase.dart';
import 'package:mindfultodo/features/today/domain/usecases/update_task_status_usecase.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_states.dart';

class TodayCubit extends Cubit<TodayStates> {
  TodayCubit() : super(TodayInitialState());

  static TodayCubit get(context) => BlocProvider.of(context);
  final getAllTasksUsecase = sl.get<GetAllTasksUsecase>();
  final updateTaskStatusUsecase = sl.get<UpdateTaskUsecase>();
  final _deleteTaskUsecase = sl.get<DeleteTaskUsecase>();

  List<TaskEntity> tasksList = [];
  List<TaskEntity> sportsTasksList = [];
  List<TaskEntity> entertainmentTasksList = [];
  List<TaskEntity> studyTasksList = [];
  List<TaskEntity> shoppingTasksList = [];
  List<TaskEntity> otherTasksList = [];

  Future<void> getAllTasks() async {
    emit(TodayLoadingState());
    final result = await getAllTasksUsecase.call();
    tasksList = result;
    sportsTasksList = tasksList
        .where((task) => task.category == 'Sports')
        .toList();
    log('Sports Tasks: ${sportsTasksList.length}');
    entertainmentTasksList = tasksList
        .where((task) => task.category == 'Entertainment')
        .toList();
    log('Entertainment Tasks: ${entertainmentTasksList.length}');
    studyTasksList = tasksList
        .where((task) => task.category == 'Study')
        .toList();
    log('Study Tasks: ${studyTasksList.length}');
    shoppingTasksList = tasksList
        .where((task) => task.category == 'Shopping')
        .toList();
    log('Shopping Tasks: ${shoppingTasksList.length}');
    otherTasksList = tasksList
        .where(
          (task) =>
              task.category != 'Sports' &&
              task.category != 'Entertainment' &&
              task.category != 'Study' &&
              task.category != 'Shopping',
        )
        .toList();
    log('Other Tasks: ${otherTasksList.length}');
    emit(GetAllTasksSuccessState(tasks: result));
  }

  double calculateDurationInHours(String startStr, String endStr) {
    String sTime = startStr.substring(10, 15);
    String eTime = endStr.substring(10, 15);

    int startMins =
        (int.parse(sTime.split(':')[0]) * 60) + int.parse(sTime.split(':')[1]);
    int endMins =
        (int.parse(eTime.split(':')[0]) * 60) + int.parse(eTime.split(':')[1]);
    int differenceInMinutes = endMins - startMins;
    if (differenceInMinutes < 0) {
      differenceInMinutes += 1440;
    }

    return differenceInMinutes / 60.0;
  }

  void markTaskAsCompleted(TaskEntity task, BuildContext context) async {
    task.isCompleted = true;
    TaskEntity updatedTask = TaskEntity(
      id: task.id,
      title: task.title,
      description: task.description,
      date: task.date,
      startTime: task.startTime,
      endTime: TimeOfDay.now().format(context),
      duration: calculateDurationInHours(task.startTime!, TimeOfDay.now().format(context)),
      category: task.category,
      isCompleted: true,
    );
    task.endTime = TimeOfDay.now().format(context);
    task.duration = calculateDurationInHours(task.startTime!, task.endTime!);
    log(
      'Marking Task as Completed: ${task.title}, Start Time: ${task.startTime}, End Time: ${task.endTime}, Duration: ${task.duration} hours',
    );
    final result = await updateTaskStatusUsecase.call(updatedTask);
    log(
      'Updated Task: ${task.title}, Status: ${task.isCompleted}, Duration: ${task.duration} hours',
    );
    emit(UpdateTaskStatusSuccessState());
  }

  void deleteTask(int taskId) async {
    String message = await _deleteTaskUsecase.call(taskId);
    tasksList.removeWhere((task) => task.id == taskId);
    emit(DeleteTaskSuccessState(message: message));
  }
}
