import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/extensions/context_extension.dart';
import 'package:to_do_list_app/core/extensions/navigation_context.dart';
import 'package:to_do_list_app/core/models/category_with_tasks.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';
import 'package:to_do_list_app/core/utils/lists.dart';
import 'package:to_do_list_app/core/utils/spaces.dart';
import 'package:to_do_list_app/features/category_details/presentation/views/category_details_view.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/category_tasks_list.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/date_widget.dart';
import 'package:to_do_list_app/features/home/presentation/widgets/rotating_icon_widget.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.categoryWithTasks});
  final CategoryWithTasks categoryWithTasks;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isExpanded = false;
  Size? widgetSize;
  final GlobalKey _key = GlobalKey();
  void _getWidetSize() {
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        widgetSize = renderBox.size;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(CategoryDetailsView.id,
            arguments: widget.categoryWithTasks);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        clipBehavior: Clip.antiAlias,
        
        height: _isExpanded
            ? context.height * 0.12 + (widgetSize?.height ?? 0.0)
            : context.height * 0.12,
        decoration: ShapeDecoration(
            color: labelColor[widget.categoryWithTasks.category.label],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(categoryItemRadius),
                side: BorderSide(
                    color: _isExpanded ? Colors.black : Colors.transparent))),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 12,
              children: [
                SizedBox(
                  width: context.width * 0.70,
                  child: Text(
                    widget.categoryWithTasks.category.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.medium20,
                  ),
                ),
                widget.categoryWithTasks.tasks.isEmpty
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                          WidgetsBinding.instance.addPostFrameCallback(
                              (_) => mounted ? _getWidetSize() : null);
                        },
                        child: RotatingIconWidget(isRotate: _isExpanded)),
              ],
            ),
            verticalSpace(16),
            _isExpanded
                ? Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: CategoryTasksList(
                        tasks: widget.categoryWithTasks.tasks,
                        key: _key,
                      ),
                  ),
                )
                : const SizedBox(),
            Row(
              spacing: 16,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(labelRadius),
                    color: AppColors.primaryColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.categoryWithTasks.category.label,
                    style: AppStyles.medium8
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ),
                DateWidget(
                  date: widget.categoryWithTasks.category.date,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
