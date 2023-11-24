import 'package:flutter/material.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';

class MyFilledButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  const MyFilledButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: AppColors.defaultColor,
          border: Border.all(
            width: 2,
            color: AppColors.defaultColor,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(
              7.0,
            ),
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
