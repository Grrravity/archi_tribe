import 'package:dartz/dartz.dart';

import '../../Core/Error/value_failure.dart';
import '../Entities/todo.dart';

abstract class TodoRepository {
  Future<Either<ValueFailure, List<Todo>?>> getTodos();
  Future<Either<ValueFailure, Todo?>> getTodoById(int id);
  Future<Either<ValueFailure, Todo?>> storeTodo(Todo todo);
  Future<Either<ValueFailure, void>> deleteTodo(int id);
}
