import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '/Domain/Entities/todo.dart';
import '../../../Core/Error/value_failure.dart';
import '../../Model/Todo/todo_model.dart';
import 'Helper/rest_api_repository.dart';

abstract class TodoRemoteSource extends RestApiRepository {
  TodoRemoteSource()
      : super(controller: '/todo', client: Get.find<Dio>(tag: 'client'));

  Future<List<TodoModel>?> getTodos();
  Future<TodoModel?> getTodoById(int id);
  Future<TodoModel?> storeTodo(Todo todo);
  Future<void> deleteTodo(int id);
}

class TodoRemoteSourceImpl extends TodoRemoteSource {
  @override
  Future<void> deleteTodo(int id) async {
    await handlingDeleteResponse(
            queryRoute: '/todo/$id', showError: true, showSuccess: true)
        .then((value) => value.fold((failure) {
              throw left(ValueFailure(
                  message: 'Impossible de supprimer la tâche',
                  details: failure.toString()));
            }, (success) {
              return right(success);
            }));
  }

  @override
  Future<TodoModel?> getTodoById(int id) async {
    await handlingGetResponse(
            queryRoute: '/todo/$id', showError: true, showSuccess: false)
        .then((value) => value.fold((failure) {
              throw left(ValueFailure(
                  message: 'Impossible de récupérerles tâches',
                  details: failure.toString()));
            }, (success) {
              return right(TodoModel.fromJson(success));
            }));
    return null;
  }

  @override
  Future<List<TodoModel>?> getTodos() async {
    await handlingGetResponse(
            queryRoute: '/todo', showError: true, showSuccess: false)
        .then((value) => value.fold((failure) {
              throw left(ValueFailure(
                  message: 'Impossible de récupérerles tâches',
                  details: failure.toString()));
            }, (success) {
              return right(success
                  .map<TodoModel>((e) => TodoModel.fromJson(e))
                  .toList());
            }));
    return null;
  }

  @override
  Future<TodoModel?> storeTodo(Todo todo) async {
    await handlingPutResponse(
            queryRoute: '/todo/${todo.id}',
            body: todo.toJson(),
            showError: true,
            showSuccess: true)
        .then((value) => value.fold((failure) {
              throw left(ValueFailure(
                  message: 'Impossible de récupérerles tâches',
                  details: failure.toString()));
            }, (success) {
              return right(TodoModel.fromJson(success));
            }));
    return null;
  }
}
