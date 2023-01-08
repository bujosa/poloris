import 'package:poloris/shared/enum/category_enum.dart';

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

  fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    date = map['date'];
    time = map['time'];
    category = map['category'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'time': time,
      'category': category,
    };
  }
}
