class TaskEntity {
  final int? id;
  String? title;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  bool? isCompleted = false;
  String? category;
  double? duration;

  TaskEntity({
    this.id,
    this.title,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.isCompleted,
    this.category,
    this.duration,
  });
}
