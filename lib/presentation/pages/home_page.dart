import 'package:flutter/material.dart';
import 'package:poloris/presentation/widgets/home/calendar_tasks.dart';
import 'package:poloris/presentation/widgets/home/completed_tasks.dart';
import 'package:poloris/presentation/widgets/home/global_tasks.dart';
import '../../shared/enum/category_enum.dart';
import '../widgets/home/active_tasks.dart';
import '../widgets/home/mini_category.dart';
import '../widgets/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
            title: 'Poloris', iconData: Icons.task, disableIcon: false),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const ActiveTasksWidget(),
                const SizedBox(
                  height: 20,
                ),
                const CalendarTaskWidget(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [CompletedTaskWidget(), GlobalTaskWidget()],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MiniCategoryWidget(category: CategoryEnum.health),
                    MiniCategoryWidget(category: CategoryEnum.work),
                    MiniCategoryWidget(category: CategoryEnum.personal),
                    MiniCategoryWidget(category: CategoryEnum.study)
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(1));
  }
}
