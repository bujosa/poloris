import 'package:flutter/material.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class CalendarTaskWidget extends StatefulWidget {
  const CalendarTaskWidget({super.key});

  @override
  State<CalendarTaskWidget> createState() => _CalendarTaskWidgetState();
}

class _CalendarTaskWidgetState extends State<CalendarTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Container(
        width: MediaQuery.of(context).size.width,
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
                const Text(
                  'Today\'s',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  taskProvider.today.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Last week',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  taskProvider.lastWeek.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Text(
              '🗓️',
              style: TextStyle(fontSize: 60),
            )
          ],
        ));
  }
}
