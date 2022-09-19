import 'package:get/get.dart';

import '../../../Data/DataSource/Local/todo_local_datasource.dart';
import '../../../Data/DataSource/Remote/todo_remote_datasource.dart';
import '../../../Data/Repositories/todo_repository_impl.dart';
import 'todo_list_controller.dart';

class TodoListControllerBindings extends Bindings {
  TodoListControllerBindings();

  @override
  void dependencies() {
    Get.lazyPut(
      () => TodoListController(
        repo: TodoRepositoryImpl(
            remoteDataSource: TodoRemoteSourceImpl(),
            localDataSource: TodoLocalSourceImpl()),
      ),
    );
  }
}
