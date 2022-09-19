import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../Core/Error/value_failure.dart';
import '../../../../Data/Repositories/todo_repository_impl.dart';
import '../../../../Domain/Entities/todo.dart';
import '../../Controller/todo_list_controller.dart';

class TodoDetailController extends GetxController with StateMixin {
  final TodoRepositoryImpl repo;
  late Todo? todo;
  int? id;

  TodoDetailController({required this.repo});
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    if (Get.arguments != null) {
      id = Get.arguments["todoId"];
    } else {
      change(null,
          status: RxStatus.error(
              "La tâche n'as pas pu être trouvée (id manquant)"));
    }

    super.onInit();
  }

  @override
  void onReady() async {
    await getTodo(id!);
    super.onReady();
  }

  Future<void> getTodo(int id) async {
    Either<ValueFailure, Todo?> response = await repo.getTodoById(id);
    response.fold((failure) {
      change(null, status: RxStatus.error(failure.message));
      debugPrint(failure.message + failure.details);
    }, (success) {
      change(null, status: RxStatus.success());
      todo = success;
    });
  }

  Future<void> markDone() async {
    Todo kTodo = Todo(
        id: todo!.id,
        title: todo!.title,
        description: todo!.description,
        isDone: true);
    Either<ValueFailure, void> response = await repo.storeTodo(kTodo);
    response.fold((failure) {
      debugPrint(failure.message + failure.details);
    }, (success) {
      return null;
    });
    Get.find<TodoListController>().onInit();
    Get.back();
  }

  Future<void> deleteTodo() async {
    Either<ValueFailure, void> response = await repo.deleteTodo(todo!.id!);
    response.fold((failure) {
      debugPrint(failure.message + failure.details);
    }, (success) {
      Get.find<TodoListController>().onInit();
      Get.back();
    });
  }

  void retry() {
    onInit();
  }
}
