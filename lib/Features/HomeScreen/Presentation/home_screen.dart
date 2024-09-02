import 'package:ecommerce/Features/HomeScreen/bloc/home_bloc.dart';
import 'package:ecommerce/Features/Widgets/banner_widget.dart';
import 'package:ecommerce/Features/Widgets/items_categories_scroller.dart';
import 'package:ecommerce/Features/Widgets/items_list_grid.dart';
import 'package:ecommerce/Features/Widgets/search_bar.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Discover",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                context.push("/cart");
              },
              child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                    ),
                  )),
            )
          ]),
      body: SingleChildScrollView(
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
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        elevation: 0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(UniconsLine.home_alt,
                    size: 30, color: AppColors.greenColor),
                Text(
                  "Home",
                  style: TextStyle(color: AppColors.greenColor),
                )
              ],
            ),
            const Column(
              children: [
                Icon(
                  UniconsLine.search,
                  size: 28,
                ),
                Text("Search")
              ],
            ),
            const Column(
              children: [
                Icon(
                  UniconsLine.heart,
                  size: 28,
                ),
                Text("Favorites")
              ],
            ),
            const Column(
              children: [
                Icon(
                  UniconsLine.user,
                  size: 28,
                ),
                Text("Profile")
              ],
            )
          ],
        ),
      ),
    );
  }
}
