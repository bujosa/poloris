import 'package:flutter/material.dart';
import 'package:poloris/presentation/pages/category/category_page.dart';
import 'package:poloris/presentation/pages/category/category_task_page.dart';
import 'package:poloris/presentation/pages/home_page.dart';
import 'package:poloris/presentation/pages/task_page.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:poloris/shared/providers/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/categories': (context) => const CategoryPage(),
          '/tasks': (context) => const TaskPage(),
          '/category/health': (context) =>
              const CategoryTaskPage(category: CategoryEnum.health),
          '/category/work': (context) => const CategoryTaskPage(
                category: CategoryEnum.work,
              ),
          '/category/personal': (context) => const CategoryTaskPage(
                category: CategoryEnum.personal,
              ),
          '/category/study': (context) => const CategoryTaskPage(
                category: CategoryEnum.study,
              ),
        },
      ),
    );
  }
}
