import 'package:ecommerce/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:ecommerce/Features/HomeScreen/Presentation/Pages/profile_page.dart';
import 'package:ecommerce/Features/HomeScreen/Presentation/Pages/search_page.dart';
import 'package:ecommerce/Features/HomeScreen/Presentation/Pages/wish_list_page.dart';
import 'package:ecommerce/Features/HomeScreen/bloc/home_bloc.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetProductEvent());
    super.initState();
  }

  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              UtilityClass.tabHeader[currentTabIndex],
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
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
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        elevation: 0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() => currentTabIndex = 0);
                },
                child: Column(
                  children: [
                    Icon(UniconsLine.home_alt,
                        size: 30, color: AppColors.greenColor),
                    Text(
                      "Home",
                      style: TextStyle(color: AppColors.greenColor),
                    )
                  ],
                )),
            GestureDetector(
              onTap: () {
                setState(() => currentTabIndex = 1);
              },
              child: const Column(
                children: [
                  Icon(
                    UniconsLine.search,
                    size: 28,
                  ),
                  Text("Search")
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() => currentTabIndex = 2);
                },
                child: const Column(
                  children: [
                    Icon(
                      UniconsLine.heart,
                      size: 28,
                    ),
                    Text("Favorites")
                  ],
                )),
            GestureDetector(
                onTap: () {
                  setState(() => currentTabIndex = 3);
                },
                child: const Column(
                  children: [
                    Icon(
                      UniconsLine.user,
                      size: 28,
                    ),
                    Text("Profile")
                  ],
                ))
          ],
        ),
      ),
    );
  }

  final tabs = [
    const HomePage(),
    const SearchPage(),
    const WishListPage(),
    const ProfilePage()
  ];
}
