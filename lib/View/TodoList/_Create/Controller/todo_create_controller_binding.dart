import 'package:get/get.dart';

import '../../../../Data/DataSource/Local/todo_local_datasource.dart';
import '../../../../Data/DataSource/Remote/todo_remote_datasource.dart';
import '../../../../Data/Repositories/todo_repository_impl.dart';
import 'todo_create_controller.dart';

class TodoCreateControllerBindings extends Bindings {
  TodoCreateControllerBindings();

  @override
  void dependencies() {
    Get.lazyPut(
      () => TodoCreateController(
        repo: TodoRepositoryImpl(
          remoteDataSource: TodoRemoteSourceImpl(),
          localDataSource: TodoLocalSourceImpl(),
        ),
      ),
    );
  }
}
