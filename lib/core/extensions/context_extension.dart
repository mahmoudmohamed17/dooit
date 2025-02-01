import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get safeHeight =>
      height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
  double get safeWidth =>
      width -
      MediaQuery.of(this).padding.left -
      MediaQuery.of(this).padding.right;
}
