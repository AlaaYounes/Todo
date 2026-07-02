import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindfultodo/core/shared/local/general_methods.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/create_task_usecase.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/delete_task_usecase.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_state.dart';
import 'package:mindfultodo/features/today/domain/usecases/get_all_tasks_usecase.dart';
import 'package:mindfultodo/features/today/domain/usecases/update_task_status_usecase.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(CreateTaskInitialState());
  static TaskCubit get(context) => BlocProvider.of(context);

  final _creatTaskUsecase = sl.get<CreateTaskUsecase>();
  final _deleteTaskUsecase = sl.get<DeleteTaskUsecase>();
  final _getAllTasksUsecase = sl.get<GetAllTasksUsecase>();
  final _updateTaskUsecase = sl.get<UpdateTaskUsecase>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  bool isFocusAreaVisible = false;
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
  late int _taskId;
  void initalizeData(TaskEntity selectedTask) {
    _taskId = selectedTask.id!;
    titleController.text = selectedTask.title!;
    descriptionController.text = selectedTask.description!;
    categoryController.text = selectedTask.category!;
    selectedDate = DateTime.parse(selectedTask.date!);
    selectedTime = GeneralMethods.convertFromSinceEpoch(
      selectedTask.startTime!,
    );
  }

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
        startTime: GeneralMethods.convertToSinceEpoch(
          selectedTime!,
          selectedDate!,
        ),
        endTime: null,
        duration: 0,
        category: focusArea.isNotEmpty ? focusArea : categoryController.text,
        isCompleted: false,
      );
      final String message = await _creatTaskUsecase.call(task);
      log(message);
      emit(AddTaskSuccessState(message));
      init();
    }
  }

  void updateTask() {
    CreateTaskLoadingState();
    TaskEntity task = TaskEntity(
      id: _taskId,
      title: titleController.text,
      description: descriptionController.text,
      date: selectedDate.toString(),
      startTime: GeneralMethods.convertToSinceEpoch(
        selectedTime!,
        selectedDate!,
      ),
      endTime: null,
      duration: 0,
      category: focusArea.isNotEmpty ? focusArea : categoryController.text,
      isCompleted: false,
    );
    _updateTaskUsecase.call(task);
    emit(UpdateTaskSuccessState(message: 'Task updated successfully.'));
    init();
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
    tasksList.clear();
    final result = await _getAllTasksUsecase.call();
    for (TaskEntity task in result) {
      if (task.isCompleted == false) {
        tasksList.add(task);
      }
    }
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
