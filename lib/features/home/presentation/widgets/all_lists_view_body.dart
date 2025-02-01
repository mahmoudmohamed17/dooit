import 'package:flutter/material.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/filled_list_body.dart';

class AllListsViewBody extends StatelessWidget {
  const AllListsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: FilledListBody());
  }
}