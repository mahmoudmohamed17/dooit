import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    icon: const Icon(
      Icons.notifications,
      color: Colors.white,
    ),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.black,
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(100),
    animationDuration: const Duration(milliseconds: 300),
    forwardAnimationCurve: Curves.easeInOut,
    reverseAnimationCurve: Curves.easeOut,
    blockBackgroundInteraction: true,
  ).show(context);
}
