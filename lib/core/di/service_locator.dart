import 'package:get_it/get_it.dart';
import 'package:mindfultodo/core/network/data/datasource/task_isar_database.dart';
import 'package:mindfultodo/core/network/data/repository/task_db_repository_impl.dart';
import 'package:mindfultodo/core/network/domain/repositories/task_db_repository.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/create_task_usecase.dart';
import 'package:mindfultodo/features/create_task/domain/usecases/delete_task_usecase.dart';
import 'package:mindfultodo/features/create_task/presentation/cubit/task_cubit.dart';
import 'package:mindfultodo/features/today/domain/usecases/get_all_tasks_usecase.dart';
import 'package:mindfultodo/features/today/domain/usecases/update_task_status_usecase.dart';
import 'package:mindfultodo/features/today/presentation/cubit/today_cubit.dart';

var sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton<TaskIsarService>(() => TaskIsarServiceImpl());
  sl.registerLazySingleton<TaskDBRepository>(() => TaskDBRepositoryImpl());
  sl.registerFactory(() => CreateTaskUsecase());
  sl.registerFactory(() => GetAllTasksUsecase());
  sl.registerFactory(() => UpdateTaskUsecase());
  sl.registerFactory(() => DeleteTaskUsecase());
  sl.registerFactory(() => TaskCubit());
  sl.registerFactory(() => TodayCubit());
}
