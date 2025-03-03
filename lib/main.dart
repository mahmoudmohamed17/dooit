import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/funcs/check_app_flow.dart';
import 'package:to_do_list_app/core/services/get_it_service.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_router.dart';
import 'package:to_do_list_app/core/utils/shared_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/features/category_details/presentation/manager/cubit/category_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/manager/pinned_cubit/pinned_cubit.dart';
import 'package:to_do_list_app/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
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
        BlocProvider(
          create: (context) => PinnedCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Dooit',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.secondaryColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: checkAppFlow(),
        onGenerateRoute: AppRouter.onGeneratedRoute,
      ),
    );
  }
}
