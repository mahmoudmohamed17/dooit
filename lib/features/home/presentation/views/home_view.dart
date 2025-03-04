import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/add_category_buttom_sheet.dart';
import 'package:to_do_list_app/core/utils/routes.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = Routes.homeView;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: const HomeViewBody(),
          floatingActionButton:
              context.read<HomeCubit>().categoriesWithTasks.isEmpty
                  ? null
                  : FloatingActionButton(
                      onPressed: () {
                        addCategoryButtomSheet(context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      backgroundColor: AppColors.primaryColor,
                      elevation: 0,
                      child: const Icon(
                        FontAwesomeIcons.plus,
                        size: 24,
                        color: AppColors.secondaryColor,
                      ),
                    ),
        );
      },
    );
  }
}
