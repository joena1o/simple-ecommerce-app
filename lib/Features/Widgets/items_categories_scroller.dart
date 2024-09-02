import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class ItemsCategoriesScroll extends StatelessWidget {
  const ItemsCategoriesScroll({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: UtilityClass.horizontalAndVerticalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "See all",
                style: TextStyle(
                    color: AppColors.greenColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width,
          height: 55,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: UtilityClass.items.length,
              itemBuilder: (BuildContext ctx, i) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(left: 15, right: 5, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Text(
                    UtilityClass.items[i],
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
