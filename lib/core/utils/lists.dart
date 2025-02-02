import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/app_colors.dart';

final List<String> labeles = [personal, work, finance, other];

final Map<String, Color> labelColor = {
  personal: AppColors.personalLabelColor,
  work: AppColors.workLabelColor,
  finance: AppColors.financeLabelColor,
  other: AppColors.otherLabelColor,
};
