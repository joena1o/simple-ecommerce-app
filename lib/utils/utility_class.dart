import 'package:flutter/material.dart';

class UtilityClass {
  static EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets horizontalAndVerticalPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  static List<String> items = [
    "All",
    "Smartphones",
    "Headphones",
    "Laptops",
    "Tv",
    "MP3",
    "Monitors",
    "Consoles"
  ];

  static final tabHeader = ["Discover", "Search", "Favorites", "Profile"];
}
