import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Theme/theme_color.dart';
import '../../Core/Widgets/x_error_widget.dart';
import 'Controller/todo_list_controller.dart';
import 'Widgets/header.dart';
import 'Widgets/list_content.dart';

class TodoListPage extends GetView<TodoListController> {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.bottomAppBarColor,
        title: Text(
          'Mes todos',
          style: Get.textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Header(controller.todos.length)),
            Expanded(child: ListContent(controller)),
          ],
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (e) => XErrorWidget(
          error: e ?? 'Erreur inattendue',
          onRetry: () => controller.retry(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.colorScheme.secondary,
        onPressed: () => controller.goToCreate(),
        child: const Icon(
          Icons.add_task_outlined,
          color: white,
        ),
      ),
    );
  }
}
