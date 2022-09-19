import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int? id;
  final String title;
  final String? description;
  final bool isDone;

  const Todo(
      {this.id, required this.title, this.description, this.isDone = false});

  @override
  List<Object?> get props => [id, title, description, isDone];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_done': isDone
    };
  }
}
