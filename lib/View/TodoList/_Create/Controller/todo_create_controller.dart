import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Error/value_failure.dart';
import '../../../../Core/Helper/validator.dart';
import '../../../../Data/Repositories/todo_repository_impl.dart';
import '../../../../Domain/Entities/todo.dart';
import '../../Controller/todo_list_controller.dart';

class TodoCreateController extends GetxController with StateMixin {
  final TodoRepositoryImpl repo;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController(text: '');
  FocusNode titleNode = FocusNode();
  final descController = TextEditingController(text: '');
  FocusNode descNode = FocusNode();

  TodoCreateController({required this.repo});
  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    super.onInit();
  }

  @override
  void onReady() {
    change(null, status: RxStatus.success());
    super.onReady();
  }

  Future<void> create() async {
    if (validateForm()) {
      Todo todo = Todo(
          title: titleController.text,
          description: descController.text == '' ? null : descController.text);

      Either<ValueFailure, void> response = await repo.storeTodo(todo);
      response.fold((failure) {
        debugPrint(failure.message + failure.details);
      }, (success) {
        Get.find<TodoListController>().onInit();
        Get.back();
      });
    }
  }

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      return true;
    }
    return false;
  }

  String? validateTitle(String? value) {
    String? validation = ValidatorMixin().fieldValidatorNotEmpty(value);
    if (validation != null) {
      titleNode.requestFocus();
    }
    return validation;
  }

  void retry() {
    onInit();
  }
}
