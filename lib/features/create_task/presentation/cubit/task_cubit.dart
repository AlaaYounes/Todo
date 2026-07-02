import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/create_task_usecase.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/delete_task_usecase.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_state.dart';
import 'package:mindfultodo/features/today/domain/usecases/get_all_tasks_usecase.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(CreateTaskInitialState());
  static TaskCubit get(context) => BlocProvider.of(context);

  final _creatTaskUsecase = sl.get<CreateTaskUsecase>();
  final _deleteTaskUsecase = sl.get<DeleteTaskUsecase>();
  final _getAllTasksUsecase = sl.get<GetAllTasksUsecase>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  bool isFocusAreaVisible = false;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  List<TaskEntity> tasksList = [];
  void changeDate(DateTime date) {
    log(date.toString());
    selectedDate = date;
    log(selectedDate.toString());
    emit(ChangeDateState());
  }

  String focusArea = '';

  void selectTime(TimeOfDay time) {
    selectedTime = time;
    emit(ChangeTimeState());
  }

  Future<void> addTask() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        (categoryController.text.isEmpty && focusArea.isEmpty)) {
      emit(AddTaskErrorState('Please fill all fields'));
      return;
    } else {
      TaskEntity task = TaskEntity(
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDate.toString(),
        startTime: selectedTime.toString(),
        endTime: '',
        duration: 0,
        category: focusArea.isNotEmpty ? focusArea : categoryController.text,
        isCompleted: false,
      );
      final String message = await _creatTaskUsecase.call(task);
      log(message);
      emit(AddTaskSuccessState(message));
      tasksList.add(task);
      init();
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    return super.close();
  }

  void selectFocusArea(String area) {
    focusArea = area;
    emit(SelectFocusAreaState());
  }

  void toggleFocusAreaVisibility() {
    focusArea = '';
    isFocusAreaVisible = !isFocusAreaVisible;
    emit(ShowFocusAreaFieldState());
  }

  void deleteTask(int taskId) async {
    String message = await _deleteTaskUsecase.call(taskId);
    tasksList.removeWhere((task) => task.id == taskId);
    emit(DeleteTaskSuccessState(message: message));
  }

  Future<void> getAllTasks() async {
    tasksList = await _getAllTasksUsecase.call();
    emit(GetAllTasksSuccessState());
  }

  void init() {
    titleController.clear();
    descriptionController.clear();
    categoryController.clear();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
    isFocusAreaVisible = false;
    focusArea = '';
  }
}
