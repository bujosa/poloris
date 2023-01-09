import 'package:flutter/material.dart';
import 'package:poloris/model/task_model.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  List<Task> myTasks = <Task>[];
  List<Task> healthTasks = <Task>[];
  List<Task> workTasks = <Task>[];
  List<Task> personalTasks = <Task>[];
  List<Task> studyTasks = <Task>[];

  TaskProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString('tasks_key');
    myTasks = tasksString == null ? [] : Task.decode(tasksString);

    String? healthString = prefs.getString('health_key');
    healthTasks = healthString == null ? [] : Task.decode(healthString);

    String? workString = prefs.getString('work_key');
    workTasks = workString == null ? [] : Task.decode(workString);

    String? personalString = prefs.getString('personal_key');
    personalTasks = personalString == null ? [] : Task.decode(personalString);

    String? studyString = prefs.getString('study_key');
    studyTasks = studyString == null ? [] : Task.decode(studyString);

    notifyListeners();
  }

  void addTask(Task task) async {
    myTasks.add(task);

    switch (task.category) {
      case CategoryEnum.health:
        healthTasks.add(task);
        await prefs.setString('health_key', Task.encode(healthTasks));
        break;
      case CategoryEnum.personal:
        personalTasks.add(task);
        await prefs.setString('personal_key', Task.encode(personalTasks));
        break;
      case CategoryEnum.study:
        studyTasks.add(task);
        await prefs.setString('study_key', Task.encode(studyTasks));
        break;
      case CategoryEnum.work:
        workTasks.add(task);
        await prefs.setString('work_key', Task.encode(workTasks));
        break;
    }

    await prefs.setString('tasks_key', Task.encode(myTasks));
    notifyListeners();
  }

  void eliminateTask(index) async {
    Task deleteTask = myTasks.removeAt(index);

    switch (deleteTask.category) {
      case CategoryEnum.health:
        healthTasks.removeWhere((element) => element.id == deleteTask.id);
        await prefs.setString('health_key', Task.encode(healthTasks));
        break;
      case CategoryEnum.personal:
        personalTasks.removeWhere((element) => element.id == deleteTask.id);
        await prefs.setString('personal_key', Task.encode(personalTasks));
        break;
      case CategoryEnum.study:
        studyTasks.removeWhere((element) => element.id == deleteTask.id);
        await prefs.setString('study_key', Task.encode(studyTasks));
        break;
      case CategoryEnum.work:
        workTasks.removeWhere((element) => element.id == deleteTask.id);
        await prefs.setString('work_key', Task.encode(workTasks));
        break;
    }

    await prefs.setString('tasks_key', Task.encode(myTasks));
    notifyListeners();
  }

  void removeTaskWorkCategory(index) async {
    Task deleteTask = workTasks.removeAt(index);
    myTasks.removeWhere((element) => element.id == deleteTask.id);
    await prefs.setString('work_key', Task.encode(workTasks));
    await prefs.setString('tasks_key', Task.encode(myTasks));
    notifyListeners();
  }

  void removeTaskInStudyList(index) async {
    Task deleteTask = studyTasks.removeAt(index);
    myTasks.removeWhere((element) => element.id == deleteTask.id);
    await prefs.setString('study_key', Task.encode(studyTasks));
    await prefs.setString('tasks_key', Task.encode(myTasks));
    notifyListeners();
  }

  void removeTaskInPersonalList(index) async {
    Task deleteTask = personalTasks.removeAt(index);
    myTasks.removeWhere((element) => element.id == deleteTask.id);
    await prefs.setString('personal_key', Task.encode(personalTasks));
    await prefs.setString('tasks_key', Task.encode(myTasks));
    notifyListeners();
  }

  void removeTaskInHealthList(index) async {
    Task deleteTask = healthTasks.removeAt(index);
    myTasks.removeWhere((element) => element.id == deleteTask.id);
    await prefs.setString('health_key', Task.encode(healthTasks));
    await prefs.setString('tasks_key', Task.encode(myTasks));
    notifyListeners();
  }

  List<Task> get tasks {
    return myTasks;
  }

  int get countPersonalCategory {
    return personalTasks.length;
  }

  int get countStudyCategory {
    return studyTasks.length;
  }

  int get countWorkCategory {
    return workTasks.length;
  }

  int get countHealthCategory {
    return healthTasks.length;
  }
}