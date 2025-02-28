import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class AddTaskTextField extends StatefulWidget {
  const AddTaskTextField({
    super.key,
    this.onChanged,
    this.onTap,
  });
  final void Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  State<AddTaskTextField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<AddTaskTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isTyping = false;
  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isTyping = _focusNode.hasPrimaryFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      style: AppStyles.regular14,
      onChanged: widget.onChanged,
      maxLines: null,
      minLines: 1,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintStyle: AppStyles.regular16.copyWith(color: AppColors.subTextColor),
        suffixIcon: _isTyping
            ? GestureDetector(
                onTap: () {
                  widget.onTap?.call();
                  FocusScope.of(context).unfocus();
                  _controller.clear();
                },
                child: const Icon(
                  FontAwesomeIcons.check,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
              )
            : null,
        hintText: 'To-Do',
        contentPadding: EdgeInsets.zero,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.transparent));
}
