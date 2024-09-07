import 'package:ecommerce/Features/Widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchBarWidget(),
      ],
    );
  }
}
