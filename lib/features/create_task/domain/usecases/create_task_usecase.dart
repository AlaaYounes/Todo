import 'package:mindfultodo/core/shared/network/domain/entities/task_entity.dart';
import 'package:mindfultodo/core/shared/network/domain/repositories/task_db_repository.dart';
import 'package:mindfultodo/core/di/service_locator.dart';

class CreateTaskUsecase {
  final TaskDBRepository taskDBRepository = sl.get<TaskDBRepository>();

  Future<String> call(TaskEntity task) => taskDBRepository.addTask(task);
}
