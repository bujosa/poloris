import 'package:flutter/material.dart';
import 'package:poloris/presentation/widgets/index.dart';
import 'package:poloris/presentation/widgets/tasks/create_task.dart';
import 'package:poloris/presentation/widgets/tasks/nothing_today.dart';
import 'package:poloris/presentation/widgets/tasks/task_tile.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:poloris/shared/utils/category_map.dart';
import 'package:poloris/shared/utils/capitalize.dart';
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
        appBar: AppBarWidget(
          title:
              '${widget.category.name.capitalize()} ${categoryMapEmoji[widget.category]!}',
          disableIcon: true,
          fontSize: categoryMapFontsize[widget.category]!,
        ),
        body: taskProvider.getTaskByCategory.isEmpty
            ? const NothingTodayWidget()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: taskProvider.getTaskByCategory.length,
                  itemBuilder: (context, index) {
                    final item = taskProvider.getTaskByCategory[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
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
