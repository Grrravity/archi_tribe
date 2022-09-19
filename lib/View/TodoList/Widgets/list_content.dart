import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Widgets/x_empty_widget.dart';
import '../Controller/todo_list_controller.dart';
import 'todo_element.dart';

class ListContent extends StatelessWidget {
  final TodoListController controller;
  const ListContent(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.todos.isNotEmpty
        ? ListView.separated(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              return TodoElement(
                controller.todos[index],
                onCheck: (done) => controller.toggleTodo(index, isDone: done),
                onTap: () => controller.goToDetail(index),
                onDelete: () => controller.deleteTodo(index),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1,
              );
            },
          )
        : const XEmptyWidget(
            title: "Zut, c'est vide !",
            message: "Créez une tâche et devenez un SuperTâcheMan",
            hasFAB: true,
          ));
  }
}
