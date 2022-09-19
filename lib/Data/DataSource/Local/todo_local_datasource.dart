import 'dart:convert';

import 'package:sqfentity_gen/sqfentity_gen.dart';

import '/Domain/Entities/todo.dart';
import '../../../Core/Error/value_failure.dart';
import '../../Database/database.dart';
import '../../Model/Todo/todo_model.dart';

abstract class TodoLocalSource {
  Future<List<TodoModel>?> getTodos();
  Future<TodoModel?> getTodoById(int id);
  Future<TodoModel?> storeTodo(Todo todo);
  Future<void> deleteTodo(int id);
}

class TodoLocalSourceImpl extends TodoLocalSource {
  TodoTable todoTable = TodoTable();

  @override
  Future<void> deleteTodo(int id) async {
    BoolResult result = await todoTable.select().id.equals(id).delete();
    if (result.success) {
      return;
    } else {
      throw ValueFailure(
          message: "Suppression impossible", details: result.errorMessage);
    }
  }

  @override
  Future<TodoModel?> getTodoById(int id) async {
    TodoTable? todoItem =
        await todoTable.select(getIsDeleted: false).id.equals(id).toSingle();
    if (todoItem != null) {
      final jsonObject = todoItem.toJson();
      try {
        TodoModel todo = TodoModel.fromJson(jsonDecode(jsonObject));
        return todo;
      } catch (e) {
        throw ValueFailure(
            message: "Erreur de conversion en model", details: e.toString());
      }
    } else {
      throw ValueFailure(message: "Aucune tâche trouvé");
    }
  }

  @override
  Future<List<TodoModel>?> getTodos() async {
    List<TodoTable>? todoItems =
        await todoTable.select(getIsDeleted: false).toList();

    final jsonObject = jsonEncode(todoItems);
    try {
      List<TodoModel> todo = (jsonDecode(jsonObject) as List)
          .map((data) => TodoModel.fromJson(jsonDecode(data)))
          .toList();
      return todo;
    } catch (e) {
      throw ValueFailure(
          message: "Erreur de conversion en model", details: e.toString());
    }
  }

  @override
  Future<TodoModel?> storeTodo(Todo todo) async {
    int? id = await TodoTable(
            id: todo.id,
            title: todo.title,
            description: todo.description,
            is_done: todo.isDone)
        .save();
    if (id != null) {
      return await getTodoById(id);
    } else {
      throw ValueFailure(message: "Impossible d'enregistrer cette todo");
    }
  }
}
