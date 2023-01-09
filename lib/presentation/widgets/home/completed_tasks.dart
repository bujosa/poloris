import 'package:flutter/material.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CompletedTaskWidget extends StatefulWidget {
  const CompletedTaskWidget({super.key});

  @override
  State<CompletedTaskWidget> createState() => _CompletedTaskWidgetState();
}

class _CompletedTaskWidgetState extends State<CompletedTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Container(
        width: MediaQuery.of(context).size.width * 0.44,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const Text(
              'Completed',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              taskProvider.totalCompleted.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
