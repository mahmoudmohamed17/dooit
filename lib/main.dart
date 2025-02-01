import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_router.dart';
import 'package:to_do_list_app/core/utils/routes.dart';
import 'package:to_do_list_app/core/utils/shared_prefs.dart';

void main() async {
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dooit',
      initialRoute: Routes.onboardingView,
      onGenerateRoute: AppRouter.onGeneratedRoute,
    );
  }
}
