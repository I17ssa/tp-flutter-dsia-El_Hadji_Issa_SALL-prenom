import 'package:flutter/foundation.dart';
import 'package:todoapp/common/task_category.dart';

class Task {
  final String title;
  final bool isDone;
  final TaskCategory category;

  Task({required this.title, required this.isDone, required this.category});

  // factory Task.fromJson(Map<String, dynamic> json) {
  // return Task(
  //     title: json['title'], isDone: json['done'], category: json['category']);
  // }
}
