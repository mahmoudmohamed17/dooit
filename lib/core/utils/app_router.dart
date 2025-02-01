import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/home/presentation/views/home_view.dart';
import 'package:to_do_list_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'routes.dart';

class AppRouter {
  static Route? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingView:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return null;
    }
  }
}
