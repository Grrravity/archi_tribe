import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Core/Error/value_failure.dart';
import '../../../Core/Routes/route.dart';
import '../../../Data/Repositories/todo_repository_impl.dart';
import '../../../Domain/Entities/todo.dart';

class TodoListController extends GetxController with StateMixin {
  final TodoRepositoryImpl repo;
  RxList<Todo> todos = <Todo>[].obs;

  TodoListController({required this.repo});
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  void onReady() async {
    await getTodos(isFirst: true);
    super.onReady();
  }

  Future<void> toggleTodo(int index, {required bool isDone}) async {
    Todo todo = Todo(
        id: todos[index].id,
        title: todos[index].title,
        description: todos[index].description,
        isDone: isDone);

    Either<ValueFailure, void> response = await repo.storeTodo(todo);
    response.fold((failure) {
      debugPrint(failure.message + failure.details);
    }, (success) {
      return null;
    });
    await getTodos();
  }

  Future<void> deleteTodo(int index) async {
    Either<ValueFailure, void> response =
        await repo.deleteTodo(todos[index].id!);
    response.fold((failure) {
      debugPrint(failure.message + failure.details);
    }, (success) {
      return null;
    });
    await getTodos();
  }

  void goToDetail(int index) {
    Get.toNamed(Routes.todo + Routes.detail,
        arguments: {'todoId': todos[index].id});
  }

  void goToCreate() async {
    Get.toNamed(Routes.todo + Routes.create);
  }

  Future<void> getTodos({bool isFirst = false}) async {
    Either<ValueFailure, List<Todo>?> response = await repo.getTodos();
    response.fold((failure) {
      if (isFirst) {
        change(null, status: RxStatus.error(failure.message));
      }
      debugPrint(failure.message + failure.details);
    }, (success) {
      if (isFirst) {
        change(null, status: RxStatus.success());
      }
      todos.value = success ?? [];
    });
  }

  void retry() {
    onInit();
  }
}
