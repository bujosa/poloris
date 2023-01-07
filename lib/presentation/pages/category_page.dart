import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Center(
              child: AppBar(
                title: const Text(
                  'Poloris Todo',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 60),
                ),
                backgroundColor: Colors.lightBlue,
                elevation: 0,
              ),
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Category Page'),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(0));
  }
}
