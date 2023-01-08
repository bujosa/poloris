import 'package:flutter/material.dart';
import '../widgets/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
            title: 'Poloris', iconData: Icons.task, disableIcon: false),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Home Page'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(1));
  }
}
