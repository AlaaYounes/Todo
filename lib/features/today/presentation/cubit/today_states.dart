import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';

class TodayStates {}

class TodayInitialState extends TodayStates {}

class TodayLoadingState extends TodayStates {}

class GetAllTasksSuccessState extends TodayStates {
  final List<TaskEntity> tasks;
  GetAllTasksSuccessState({required this.tasks});
}

class UpdateTaskStatusSuccessState extends TodayStates {}
class DeleteTaskSuccessState extends TodayStates {
  String message;
  DeleteTaskSuccessState({required this.message});
}
