import 'package:ecommerce/Features/Widgets/banner_widget.dart';
import 'package:ecommerce/Features/Widgets/items_categories_scroller.dart';
import 'package:ecommerce/Features/Widgets/items_list_grid.dart';
import 'package:ecommerce/Features/Widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: const Column(
          children: [
            SearchBarWidget(),
            SizedBox(
              height: 10,
            ),
            BannerWidget(),
            ItemsCategoriesScroll(),
            ItemsListGridView()
          ],
        ),
      ),
    );
  }
}
