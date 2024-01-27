import 'package:flutter/material.dart';
import 'package:healthon/core/app_export.dart';

class CustomFloatingButton extends StatelessWidget {
  CustomFloatingButton({
    Key? key,
    this.alignment,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
    this.decoration,
    this.child,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final BoxDecoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: fabWidget,
          )
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: decoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(27.h),
              ),
          child: child,
        ),
      );
}
