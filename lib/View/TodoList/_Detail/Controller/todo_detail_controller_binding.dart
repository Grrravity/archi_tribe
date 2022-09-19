import 'package:get/get.dart';

import '../../../../Data/DataSource/Local/todo_local_datasource.dart';
import '../../../../Data/DataSource/Remote/todo_remote_datasource.dart';
import '../../../../Data/Repositories/todo_repository_impl.dart';
import 'todo_detail_controller.dart';

class TodoDetailControllerBindings extends Bindings {
  TodoDetailControllerBindings();

  @override
  void dependencies() {
    Get.lazyPut(
      () => TodoDetailController(
        repo: TodoRepositoryImpl(
          remoteDataSource: TodoRemoteSourceImpl(),
          localDataSource: TodoLocalSourceImpl(),
        ),
      ),
    );
  }
}
