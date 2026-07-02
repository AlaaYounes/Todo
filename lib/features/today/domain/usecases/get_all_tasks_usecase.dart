import 'package:mindfultodo/core/di/service_locator.dart';
import 'package:mindfultodo/core/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/core/network/domain/repositories/task_db_repository.dart';

class GetAllTasksUsecase {
  final TaskDBRepository taskDBRepository = sl.get<TaskDBRepository>();
  Future<List<TaskEntity>> call() async {
    return await taskDBRepository.getTasks();
  }
}