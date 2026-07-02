import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/core/shared/local/general_methods.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/delete_task_usecase.dart';
import 'package:mindfultodo/features/today/domain/usecases/get_all_tasks_usecase.dart';
import 'package:mindfultodo/features/today/domain/usecases/update_task_status_usecase.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_states.dart';

class TodayCubit extends Cubit<TodayStates> {
  TodayCubit() : super(TodayInitialState());

  static TodayCubit get(context) => BlocProvider.of(context);
  final _getAllTasksUsecase = sl.get<GetAllTasksUsecase>();
  final _updateTaskStatusUsecase = sl.get<UpdateTaskUsecase>();
  final _deleteTaskUsecase = sl.get<DeleteTaskUsecase>();

  List<TaskEntity> tasksList = [];
  List<TaskEntity> sportsTasksList = [];
  List<TaskEntity> entertainmentTasksList = [];
  List<TaskEntity> studyTasksList = [];
  List<TaskEntity> shoppingTasksList = [];
  List<TaskEntity> otherTasksList = [];

  Future<void> getAllTasks() async {
    emit(TodayLoadingState());
    final result = await _getAllTasksUsecase.call();
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

  double calculateDurationInHours(int startEpoch, int endEpoch) {
    int differenceInMilliseconds = endEpoch - startEpoch;
    Duration duration = Duration(milliseconds: differenceInMilliseconds);
    double durationInHours = duration.inMinutes / 60.0;
    return (durationInHours * 100).round() / 100;
  }

  void markTaskAsCompleted(TaskEntity task, BuildContext context) async {
    double duration = calculateDurationInHours(
      task.startTime!,
      GeneralMethods.convertToSinceEpoch(
        TimeOfDay.now(),
        DateTime.now(),
      ),
    );
    task.isCompleted = true;
    TaskEntity updatedTask = TaskEntity(
      id: task.id,
      title: task.title,
      description: task.description,
      date: task.date,
      startTime: task.startTime,
      endTime: GeneralMethods.convertToSinceEpoch(
        TimeOfDay.now(),
        DateTime.now(),
      ),
      duration: duration,
      category: task.category,
      isCompleted: true,
    );
    log(
      'Marking Task as Completed: ${task.title}, Start Time: ${task.startTime}, End Time: ${task.endTime}, Duration: ${task.duration} hours',
    );
    final result = await _updateTaskStatusUsecase.call(updatedTask);
    log(
      'Updated Task: ${updatedTask.title}, Status: ${updatedTask.isCompleted}, Duration: ${updatedTask.duration} hours',
    );
    emit(UpdateTaskStatusSuccessState());
  }

  void deleteTask(int taskId) async {
    String message = await _deleteTaskUsecase.call(taskId);
    tasksList.removeWhere((task) => task.id == taskId);
    emit(DeleteTaskSuccessState(message: message));
  }
}
