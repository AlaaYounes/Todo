import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/core/shared/network/domain/repositories/task_db_repository.dart';

class DeleteTaskUsecase {
  final TaskDBRepositoryImpl = sl.get<TaskDBRepository>();

  Future<String> call(int taskId) {
    return TaskDBRepositoryImpl.deleteTask(taskId);
  }
}