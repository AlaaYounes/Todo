import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:mindfultodo/core/shared/network/data/models/task_model.dart';
import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:path_provider/path_provider.dart';

abstract class TaskIsarService {
  Future<String> addTask(TaskEntity task);
  Future<List<TaskEntity>> getTasks();
  Future<String> updateTask(TaskEntity task);
  Future<String> deleteTask(int taskId);
}

class TaskIsarServiceImpl implements TaskIsarService {
  late Future<Isar> db;

  TaskIsarServiceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    try {
      final dir = await getApplicationDocumentsDirectory();

      if (Isar.instanceNames.isEmpty) {
        return await Isar.open([TaskModelSchema], directory: dir.path);
      }

      return Future.value(Isar.getInstance());
    } catch (e) {
      // If the database fails to open entirely, throw an exception
      // since the app cannot function without it.
      throw Exception('Failed to open Isar database: $e');
    }
  }

  @override
  Future<String> addTask(TaskEntity task) async {
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        await isar.taskModels.put(TaskModel.fromEntity(task));
      });
      return 'Task added successfully.';
    } catch (e) {
      return 'Error adding task: ${e.toString()}';
    }
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    try {
      final isar = await db;
      List<TaskModel> tasks = await isar.taskModels.where().findAll();
      log('tasks: ${tasks.length}');
      List<TaskEntity> taskEntities = tasks.map((e) => e.toEntity()).toList();
      log('taskEntities: ${taskEntities.length}');
      return taskEntities;
    } catch (e) {
      // Log the error and return an empty list to prevent UI crashes
      print('Error fetching tasks: $e');
      return [];
    }
  }

  @override
  Future<String> updateTask(TaskEntity task) async {
    try {
      final isar = await db;
      await isar.writeTxn(() async {
        await isar.taskModels.put(TaskModel.fromEntity(task));
      });
      return 'Task updated successfully.';
    } catch (e) {
      return 'Error updating task: ${e.toString()}';
    }
  }

  @override
  Future<String> deleteTask(int taskId) async {
    try {
      final isar = await db;
      bool success = false;

      await isar.writeTxn(() async {
        // Isar's delete method returns a boolean indicating if a record was actually deleted
        success = await isar.taskModels.delete(taskId);
      });

      if (success) {
        return 'Task deleted successfully.';
      } else {
        return 'Error: Task not found.';
      }
    } catch (e) {
      return 'Error deleting task: ${e.toString()}';
    }
  }
}
