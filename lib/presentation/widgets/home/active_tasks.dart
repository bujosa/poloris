import 'package:flutter/material.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TotalActiveWidget extends StatefulWidget {
  const TotalActiveWidget({super.key});

  @override
  State<TotalActiveWidget> createState() => _TotalActiveWidgetState();
}

class _TotalActiveWidgetState extends State<TotalActiveWidget> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tasks');
      },
      child: Container(
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
                    'Total Active tasks',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    taskProvider.myTasks.length.toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Icon(
                Icons.timeline,
                color: Colors.blue,
                size: 80,
              )
            ],
          )),
    );
  }
}
