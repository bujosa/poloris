import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Row(
            children: const <Widget>[
              Text(
                'Poloris',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60),
              ),
              Icon(Icons.task, color: Colors.white, size: 60)
            ],
          ),
          backgroundColor: Colors.brown[300],
          elevation: 0,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
