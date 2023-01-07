import 'package:flutter/material.dart';
import '../widgets/index.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
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
