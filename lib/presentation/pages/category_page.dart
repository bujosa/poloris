import 'package:flutter/material.dart';
import 'package:poloris/presentation/widgets/category.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import '../widgets/index.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Categories',
          disableIcon: true,
          fontSize: 50,
        ),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const CategoryWidget(
                    'Health',
                    CategoryEnum.health,
                    'assets/images/exercise.png',
                    Color.fromARGB(255, 217, 249, 194),
                    Colors.black),
                const CategoryWidget(
                    'Study',
                    CategoryEnum.study,
                    'assets/images/study.png',
                    Color.fromRGBO(232, 245, 233, 1),
                    Colors.black),
                const CategoryWidget(
                    'Work',
                    CategoryEnum.work,
                    'assets/images/work.png',
                    Color.fromARGB(255, 250, 199, 199),
                    Colors.black),
                const CategoryWidget(
                    'Personal',
                    CategoryEnum.personal,
                    'assets/images/other.png',
                    Color.fromARGB(255, 150, 235, 229),
                    Colors.black),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: const BottomNavigationBarWidget(0));
  }
}
