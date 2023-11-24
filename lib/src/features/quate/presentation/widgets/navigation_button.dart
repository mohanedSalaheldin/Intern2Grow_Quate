import 'package:flutter/material.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';

class NavigationButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final bool? fullyRounded;

  const NavigationButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.fullyRounded = false,
  });
  BorderRadius _choseBorderStyle(bool fullyRounded) {
    if (fullyRounded) {
      return const BorderRadius.only(
        topLeft: Radius.circular(7.0),
        topRight: Radius.circular(7.0),
        bottomRight: Radius.circular(7.0),
        bottomLeft: Radius.circular(7.0),
      );
    } else {
      return const BorderRadius.only(
        topLeft: Radius.circular(7.0),
        topRight: Radius.circular(7.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whitePurple,
        borderRadius: _choseBorderStyle(fullyRounded!),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
