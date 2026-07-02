import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';

abstract class TaskDBRepository {
Future<String> addTask(TaskEntity task);
  Future<List<TaskEntity>> getTasks();
  Future<String> updateTask(TaskEntity task);
  Future<String> deleteTask(int taskId);
}