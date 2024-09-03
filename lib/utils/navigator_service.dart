import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void goTo(name) {
    navigatorKey.currentState?.pushNamed(name);
  }

  void goBack(name) {
    navigatorKey.currentState?.pop();
  }

  void goToAndReplace(name) {
    navigatorKey.currentState?.pushReplacementNamed(name);
  }
}
