import 'package:mindfultodo/core/shared/network/data/datasource/task_isar_database.dart';
import 'package:mindfultodo/core/shared/network/data/models/task_model.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/core/shared/network/domain/repositories/task_db_repository.dart';
import 'package:mindfultodo/core/di/service_locator.dart';

class TaskDBRepositoryImpl implements TaskDBRepository {
  final  taskIsarService = sl.get<TaskIsarService>();
  @override

  Future<String> addTask(TaskEntity task) {
    return taskIsarService.addTask(task);
  }

  @override
  Future<String> deleteTask(int taskId) {
    return taskIsarService.deleteTask(taskId);
  }

  @override
  Future<List<TaskEntity>> getTasks() {
    return taskIsarService.getTasks();
  }

  @override
  Future<String> updateTask(TaskEntity task) {
    return taskIsarService.updateTask(task);
  }
}
