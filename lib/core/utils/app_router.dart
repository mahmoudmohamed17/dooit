import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/features/category_details/presentation/views/category_details_view.dart';
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
      case Routes.categoryDetailsView:
      final categoryWithTasks = settings.arguments as CategoryWithTasks;
        return MaterialPageRoute(builder: (_) =>  CategoryDetailsView(categoryWithTasks: categoryWithTasks,));
      default:
        return null;
    }
  }
}
