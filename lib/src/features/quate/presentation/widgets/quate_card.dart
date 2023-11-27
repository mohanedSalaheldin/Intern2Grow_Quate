import 'package:flutter/material.dart';
import 'package:quate_app/src/core/utils/app_colors.dart';

class QuateCard extends StatelessWidget {
  final Widget child;
  final String quateContent;
  final String quateAuther;
  final bool? fullyRounded;
  

  const QuateCard({
    super.key,
    required this.child,
    required this.quateContent,
    required this.quateAuther,
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
        bottomLeft: Radius.circular(7.0),
        bottomRight: Radius.circular(7.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: _choseBorderStyle(fullyRounded!),
      ),
      child: Column(
        children: [
          Text(
            quateContent,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              quateAuther,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          child,
        ],
      ),
    );
  }
}
