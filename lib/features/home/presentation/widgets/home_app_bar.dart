import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/app_logo_widget.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/custom_search_delegate.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppLogoWidget(),
        GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: CustomSearchDelegate(context.read<HomeCubit>().categoriesWithTasks));
          },
          child: const Icon(
            FontAwesomeIcons.magnifyingGlass,
          ),
        ),
      ],
    );
  }
}
