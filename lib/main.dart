import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/utils/app_router.dart';
import 'package:to_do_list_app/core/utils/routes.dart';
import 'package:to_do_list_app/core/utils/shared_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  Bloc.observer = MyBlocObserver();
  await Future.delayed(const Duration(seconds: 2), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: const MaterialApp(
        title: 'Dooit',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onboardingView,
        onGenerateRoute: AppRouter.onGeneratedRoute,
      ),
    );
  }
}
