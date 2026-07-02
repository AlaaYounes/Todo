class TaskStates {}

class CreateTaskInitialState extends TaskStates {}

class ChangeDateState extends TaskStates {}

class ChangeTimeState extends TaskStates {}

class AddTaskSuccessState extends TaskStates {
  final String message;
  AddTaskSuccessState(this.message);
}

class AddTaskErrorState extends TaskStates {
  final String errorMessage;
  AddTaskErrorState(this.errorMessage);
}

class ShowFocusAreaFieldState extends TaskStates {}

class SelectFocusAreaState extends TaskStates {}

class DeleteTaskSuccessState extends TaskStates {
  String message;
  DeleteTaskSuccessState({required this.message});
}

class GetAllTasksSuccessState extends TaskStates {}
