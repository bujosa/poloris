import 'package:flutter/material.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:provider/provider.dart';

import '../../shared/providers/task_provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      this.label, this.category, this.asset, this.color, this.textColor,
      {super.key});

  final String label;
  final String asset;
  final CategoryEnum category;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            asset,
            width: 150,
            height: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 30, color: textColor)),
              Text('Tasks: ${taskProvider.countCategory(category)}',
                  style: TextStyle(fontSize: 20, color: textColor)),
            ],
          ),
        ],
      ),
    );
  }
}
