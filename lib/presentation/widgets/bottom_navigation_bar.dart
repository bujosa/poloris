import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(this.currentIndex, {super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.category,
          ),
          label: 'Categories',
          tooltip: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          tooltip: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task),
          label: 'Tasks',
          tooltip: 'Tasks',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.blueGrey,
      selectedIconTheme: const IconThemeData(
          size: 35,
          shadows: [
            Shadow(
              blurRadius: 2,
              offset: Offset(0, 0),
            )
          ],
          opacity: 30),
      unselectedIconTheme: const IconThemeData(
          size: 30,
          color: Colors.grey,
          shadows: [
            Shadow(
              blurRadius: 2,
              color: Colors.black,
              offset: Offset(0, 0),
            )
          ],
          opacity: 30),
      elevation: 10,
      showSelectedLabels: false,
      showUnselectedLabels: false,
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
