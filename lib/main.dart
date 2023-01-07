import 'package:flutter/material.dart';
import 'package:poloris/presentation/pages/category_page.dart';
import 'package:poloris/presentation/pages/home_page.dart';
import 'package:poloris/presentation/pages/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/categories': (context) => const CategoryPage(),
        '/tasks': (context) => const TaskPage(),
      },
    );
  }
}
