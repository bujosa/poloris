import 'package:poloris/shared/enum/category_enum.dart';
import 'dart:convert';

class Task {
  int id;
  String title;
  String date;
  int time;
  CategoryEnum category;

  Task(
      {required this.id,
      required this.title,
      required this.date,
      required this.time,
      required this.category});

  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(
      id: jsonData['id'],
      title: jsonData['title'],
      date: jsonData['date'],
      time: jsonData['time'],
      category: CategoryEnum.values.byName(jsonData['category']),
    );
  }

  static Map<String, dynamic> toMap(Task task) => {
        'id': task.id,
        'title': task.title,
        'date': task.date,
        'time': task.time,
        'category': task.category.name,
      };

  static String encode(List<Task> tasks) => json.encode(
        tasks.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
      );

  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromJson(item))
          .toList();
}
