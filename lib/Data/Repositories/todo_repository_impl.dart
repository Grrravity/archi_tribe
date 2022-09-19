import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../Core/Error/value_failure.dart';
import '../../Core/Services/connectivity_checker.dart';
import '../../Domain/Entities/todo.dart';
import '../../Domain/Repositories/todo_repository.dart';
import '../DataSource/Local/todo_local_datasource.dart';
import '../DataSource/Remote/todo_remote_datasource.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoRemoteSource remoteDataSource;
  final TodoLocalSource localDataSource;
  ConnectivityChecker connectivityChecker =
      Get.find<ConnectivityChecker>(tag: "connectivity");

  TodoRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
  @override
  Future<Either<ValueFailure, void>> deleteTodo(int id,
      {bool retry = false}) async {
    if (connectivityChecker.connectionType != 0 && !retry) {
      try {
        await remoteDataSource.deleteTodo(id);
        return right(null);
      } on ValueFailure catch (failure) {
        //FIXME workaround pour exemple
        debugPrint(failure.toString());
        return await deleteTodo(id, retry: true);
        //return left(failure);
      } catch (e) {
        return await deleteTodo(id, retry: true);
        //return left(ValueFailure(
        //    message:
        //        "Erreur inatendue lors de la supression d'une tâche (remote)"));
      }
    } else {
      try {
        await localDataSource.deleteTodo(id);
        return right(null);
      } on ValueFailure catch (failure) {
        return left(failure);
      } catch (e) {
        return left(ValueFailure(
            message:
                "Erreur inatendue lors de la supression d'une tâche (locale)"));
      }
    }
  }

  @override
  Future<Either<ValueFailure, Todo?>> getTodoById(int id,
      {bool retry = false}) async {
    if (connectivityChecker.connectionType != 0 && !retry) {
      try {
        Todo? todo = await remoteDataSource.getTodoById(id);
        return right(todo);
      } on ValueFailure catch (failure) {
        //FIXME workaround pour exemple
        debugPrint(failure.toString());
        return await getTodoById(id, retry: true);
        //return left(failure);
      } catch (e) {
        return await getTodoById(id, retry: true);
        //return left(ValueFailure(
        //    message:
        //        "Erreur inatendue lors de la récupération d'une tâche (remote)"));
      }
    } else {
      try {
        Todo? todo = await localDataSource.getTodoById(id);
        return right(todo);
      } on ValueFailure catch (failure) {
        return left(failure);
      } catch (e) {
        return left(ValueFailure(
            message:
                "Erreur inatendue lors de la récupération d'une tâche (locale)"));
      }
    }
  }

  @override
  Future<Either<ValueFailure, List<Todo>?>> getTodos(
      {bool retry = false}) async {
    if (connectivityChecker.connectionType != 0 && !retry) {
      try {
        List<Todo>? todos = await remoteDataSource.getTodos();
        return right(todos);
      } on ValueFailure catch (failure) {
        //FIXME workaround pour exemple
        debugPrint(failure.toString());
        return await getTodos(retry: true);
        //return left(failure);
      } catch (e) {
        return await getTodos(retry: true);
        //return left(ValueFailure(
        //    message:
        //        "Erreur inatendue lors de la récupération des tâches (remote)"));
      }
    } else {
      try {
        List<Todo>? todos = await localDataSource.getTodos();
        return right(todos);
      } on ValueFailure catch (failure) {
        return left(failure);
      } catch (e) {
        return left(ValueFailure(
            message:
                "Erreur inatendue lors de la récupération des tâches (locale)"));
      }
    }
  }

  @override
  Future<Either<ValueFailure, Todo?>> storeTodo(Todo todo,
      {bool retry = false}) async {
    if (connectivityChecker.connectionType != 0 && !retry) {
      try {
        Todo? storedTodo = await remoteDataSource.storeTodo(todo);
        return right(storedTodo);
      } on ValueFailure catch (failure) {
        //FIXME workaround pour exemple
        debugPrint(failure.toString());
        return await storeTodo(todo, retry: true);
        //return left(failure);
      } catch (e) {
        return await storeTodo(todo, retry: true);
        //return left(ValueFailure(
        //    message: "Erreur inatendue lors de l'envoi d'une tâche (remote)"));
      }
    } else {
      try {
        Todo? storedTodo = await localDataSource.storeTodo(todo);
        return right(storedTodo);
      } on ValueFailure catch (failure) {
        return left(failure);
      } catch (e) {
        return left(ValueFailure(
            message: "Erreur inatendue lors de l'envoi d'une tâche (locale)"));
      }
    }
  }
}
