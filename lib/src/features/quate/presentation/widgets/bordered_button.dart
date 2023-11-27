import 'package:flutter/material.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';

class MyBorderedButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final bool? inFavorite;
  final bool? fullyRounded;
  const MyBorderedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.fullyRounded = false,
    this.inFavorite,
  });
  BorderRadius _choseBorderStyle(bool fullyRounded) {
    if (!fullyRounded) {
      return const BorderRadius.only(
        bottomRight: Radius.circular(7.0),
      );
    } else {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(7.0),
        bottomRight: Radius.circular(7.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 2,
          color: AppColors.defaultColor,
        ),
        borderRadius: _choseBorderStyle(fullyRounded!),
      ),
      child: MaterialButton(
        // height: 70.0,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
