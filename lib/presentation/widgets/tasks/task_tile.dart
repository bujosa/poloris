import 'package:flutter/material.dart';
import 'package:poloris/models/task_model.dart';
import 'package:poloris/shared/utils/category_map.dart';

class TaskTileWidget extends StatefulWidget {
  const TaskTileWidget({super.key, required this.item, required this.callback});

  final Task item;
  final Function callback;

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: Key(widget.item.id.toString()),
      onDismissed: (direction) {
        setState(() {
          widget.callback();
        });
      },
      background: Container(
          alignment: Alignment.centerLeft,
          color: const Color.fromARGB(255, 5, 83, 8),
          child: Row(children: const [
            Icon(Icons.task_alt, color: Colors.white, size: 40),
            Text(
              'Completed',
              style: TextStyle(fontSize: 30, color: Colors.white),
            )
          ])),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                categoryMapEmoji[widget.item.category].toString(),
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.item.title,
                style: const TextStyle(fontSize: 23),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
