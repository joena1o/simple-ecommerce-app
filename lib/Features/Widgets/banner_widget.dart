import 'package:flutter/material.dart';
import "package:ecommerce/utils/utility_class.dart";

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: UtilityClass.horizontalPadding,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      width: size.width,
      height: 170,
    );
  }
}
