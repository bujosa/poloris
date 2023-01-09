import 'package:flutter/material.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:poloris/shared/utils/category_map.dart';
import 'package:provider/provider.dart';
import 'package:poloris/shared/utils/capitalize.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(this.category, {super.key});

  final CategoryEnum category;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        taskProvider.updateCategory(category);
        Navigator.pushNamed(context, '/category/${category.name}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(categoryMapEmoji[category].toString(),
                  style: const TextStyle(fontSize: 60)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(category.name.capitalize(),
                    style: const TextStyle(fontSize: 30)),
                Text('Tasks: ${taskProvider.countCategory(category)}',
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
