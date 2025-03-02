import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';
import 'package:to_do_list_app/core/utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue = '',
    this.onChanged,
    this.hintText = '',
    this.onTap,
    this.isChecked,
    this.fontWeight,
    this.fontSize,
  });
  final String? initialValue;
  final String hintText;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? isChecked;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _isTyping = false;
  @override
  void initState() {
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
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.top,
      focusNode: _focusNode,
      style: AppStyles.regular14.copyWith(
          fontWeight: widget.fontWeight ?? widget.fontWeight,
          fontSize: widget.fontSize ?? widget.fontSize,
          decoration: widget.isChecked == null
              ? null
              : widget.isChecked!
                  ? TextDecoration.lineThrough
                  : null),
      onChanged: widget.onChanged,
      maxLines: null,
      minLines: 1,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        hintText: widget.hintText.isEmpty ? '' : widget.hintText,
        hintStyle: AppStyles.regular16.copyWith(
          color: AppColors.subTextColor,
          fontWeight: widget.fontWeight ?? widget.fontWeight,
          fontSize: widget.fontSize ?? widget.fontSize,
        ),
        suffixIcon: _isTyping
            ? GestureDetector(
                onTap: () {
                  widget.onTap?.call();
                  FocusScope.of(context).unfocus();
                },
                child: const Icon(
                  FontAwesomeIcons.check,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
              )
            : null,
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
