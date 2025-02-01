import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  static Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingView:
        return MaterialPageRoute(builder: (_) => Scaffold());
      default:
        return null;
    }
  }
}
