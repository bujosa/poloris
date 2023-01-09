import 'package:flutter/material.dart';
import 'package:poloris/presentation/widgets/index.dart';
import 'package:poloris/presentation/widgets/tasks/create_task.dart';
import 'package:poloris/presentation/widgets/tasks/task_tile.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CategoryTaskPage extends StatefulWidget {
  const CategoryTaskPage({super.key, required this.category});

  final CategoryEnum category;

  @override
  State<CategoryTaskPage> createState() => _CategoryTaskPageState();
}

class _CategoryTaskPageState extends State<CategoryTaskPage> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Tasks',
          disableIcon: false,
          iconData: Icons.task_alt,
        ),
        body: taskProvider.getTaskByCategory.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('Nothing today!', style: TextStyle(fontSize: 40)),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: taskProvider.getTaskByCategory.length,
                  itemBuilder: (context, index) {
                    final item = taskProvider.getTaskByCategory[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: TaskTileWidget(
                          item: item,
                          callback: () {
                            setState(() {
                              taskProvider.eliminateTaskByCategory(index);
                            });
                          },
                        ));
                  },
                ),
              ),
        floatingActionButton: const CreateTaskBottomWidget(
          isGlobal: false,
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(2));
  }
}
