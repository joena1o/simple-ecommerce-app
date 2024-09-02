import 'package:ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.grey[200]),
      margin: UtilityClass.horizontalAndVerticalPadding,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: "Search"),
            ),
          ),
          Icon(
            Icons.search,
            size: 32,
          )
        ],
      ),
    );
  }
}
