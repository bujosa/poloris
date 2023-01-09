import 'package:flutter/material.dart';
import 'package:poloris/presentation/widgets/category/category.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import '../../widgets/index.dart';

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
                const CategoryWidget(CategoryEnum.personal),
                const CategoryWidget(CategoryEnum.study),
                const CategoryWidget(CategoryEnum.health),
                const CategoryWidget(CategoryEnum.work),
              ],
            ),
          ),
        ]),
        bottomNavigationBar: const BottomNavigationBarWidget(0));
  }
}
