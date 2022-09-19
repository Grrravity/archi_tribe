import '../../../Domain/Entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel(
      {int? id,
      required String title,
      String? description,
      required bool isDone})
      : super(id: id, title: title, description: description, isDone: isDone);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: (json["id"] as num?)?.toInt(),
        title: json["title"],
        description: json["description"],
        isDone: json["is_done"] as bool);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_done': isDone
    };
  }
}
