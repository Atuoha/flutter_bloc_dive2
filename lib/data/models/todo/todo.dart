import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter {
  all,
  completed,
  active,
}

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String title;
  final String content;
  bool isCompleted;
  final DateTime date;

  Todo({
    String? id,
    required this.title,
    required this.content,
    required this.date,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();

  @override
  String toString() =>
      'Todo{id: $id, title: $title, content: $content, isCompleted: $isCompleted, date: $date}';

  @override
  List<Object?> get props => [id, title, content, isCompleted, date];
}
