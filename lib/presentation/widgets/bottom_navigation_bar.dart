import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(this.currentIndex, {super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.category, size: 30),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task, size: 30),
          label: 'tasks',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.brown[300],
      elevation: 10,
      showSelectedLabels: true,
      onTap: (value) => {
        if (value != currentIndex)
          {
            if (value == 0)
              {
                Navigator.pushNamed(context, '/categories'),
              }
            else if (value == 1)
              {
                // Clear the stack and push the home page
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (Route<dynamic> route) => false),
              }
            else if (value == 2)
              {
                Navigator.pushNamed(context, '/tasks'),
              }
          }
      },
    );
  }
}
