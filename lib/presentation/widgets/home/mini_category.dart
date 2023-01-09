import 'package:flutter/material.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:poloris/shared/utils/category_map.dart';
import 'package:provider/provider.dart';

import '../../../shared/enum/category_enum.dart';

class MiniCategoryWidget extends StatefulWidget {
  const MiniCategoryWidget({super.key, required this.category});

  final CategoryEnum category;

  @override
  State<MiniCategoryWidget> createState() => _MiniCategoryWidgetState();
}

class _MiniCategoryWidgetState extends State<MiniCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        taskProvider.updateCategory(widget.category);
        Navigator.pushNamed(context, '/category/${widget.category.name}');
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0.0, 0.0),
              )
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoryMapEmoji[widget.category]!,
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    taskProvider.countCategory(widget.category).toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
