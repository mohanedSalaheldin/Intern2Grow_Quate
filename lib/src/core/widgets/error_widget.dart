import 'package:flutter/material.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/quate_card.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QuateCard(
          quateContent: error,
          quateAuther: '',
          child: Text(
            'Reload Now',
            style: Theme.of(context).textTheme.bodySmall,
          )),
    );
  }
}
