import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Widgets/x_error_widget.dart';
import 'Controller/todo_detail_controller.dart';
import 'Widgets/todo_detail.dart';

class TodoDetailPage extends GetView<TodoDetailController> {
  const TodoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.bottomAppBarColor,
        title: Text(
          'Détail de la tâche',
          style: Get.textTheme.headline4,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Get.theme.primaryColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: controller.obx(
        (state) => TodoDetail(controller),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (e) => XErrorWidget(
          error: e ?? 'Erreur inattendue',
          onRetry: () => controller.retry(),
        ),
      ),
    );
  }
}
