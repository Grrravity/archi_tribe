import 'package:get/get.dart';

import '../../View/TodoList/_Create/todo_create_export.dart';
import '../../View/TodoList/_Detail/todo_detail_export.dart';
import '../../View/TodoList/todo_list_export.dart';
import 'route.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      title: 'todo-list',
      name: Routes.todo,
      page: () => const TodoListPage(),
      binding: TodoListControllerBindings(),
      children: [
        GetPage(
          title: 'create',
          name: Routes.create,
          page: () => const TodoCreatePage(),
          binding: TodoCreateControllerBindings(),
        ),
        GetPage(
          title: 'detail',
          name: Routes.detail,
          page: () => const TodoDetailPage(),
          binding: TodoDetailControllerBindings(),
        ),
      ],
    ),
  ];
}
