import 'package:flutter/material.dart';
import 'package:poloris/presentation/widgets/tasks/create_task.dart';
import 'package:poloris/presentation/widgets/tasks/nothing_today.dart';
import 'package:poloris/presentation/widgets/tasks/task_tile.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/index.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Tasks',
          disableIcon: false,
          iconData: Icons.task_alt,
        ),
        body: taskProvider.myTasks.isEmpty
            ? const NothingTodayWidget()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: taskProvider.myTasks.length,
                  itemBuilder: (context, index) {
                    final item = taskProvider.myTasks[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        child: TaskTileWidget(
                          item: item,
                          callback: () {
                            setState(() {
                              taskProvider.eliminateTask(index);
                            });
                          },
                        ));
                  },
                ),
              ),
        floatingActionButton: const CreateTaskBottomWidget(isGlobal: true),
        bottomNavigationBar: const BottomNavigationBarWidget(2));
  }
}
