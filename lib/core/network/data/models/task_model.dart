import 'package:isar/isar.dart';
import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';
part 'task_model.g.dart';

@collection
class TaskModel {
  Id id = Isar.autoIncrement;

  String? title;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  double? duration;
  String? category;
  bool? isCompleted = false;
  TaskModel({
    this.title,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.duration,
    this.isCompleted,
    this.category,
  });

  factory TaskModel.fromEntity(TaskEntity entity) {
    final model = TaskModel(
      title: entity.title,
      description: entity.description,
      date: entity.date,
      startTime: entity.startTime,
      endTime: entity.endTime,
      duration: entity.duration,
      isCompleted: entity.isCompleted,
      category: entity.category,
    );
    if (entity.id != null) {
      model.id = entity.id!;
    }
    return model;
  }

  // Translator: Isar Model -> Domain Entity
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      title: title,
      description: description,
      date: date,
      startTime: startTime,
      isCompleted: isCompleted,
      category: category,
      endTime: endTime,
      duration: duration,
    );
  }
}
