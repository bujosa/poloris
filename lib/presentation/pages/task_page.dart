import 'package:flutter/material.dart';
import '../widgets/index.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(title: 'Tasks', disableIcon: false, iconData: Icons.task_alt,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Task Page'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(2));
  }
}
