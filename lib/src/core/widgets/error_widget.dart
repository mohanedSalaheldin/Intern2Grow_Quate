import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:quate_app/src/features/quate/presentation/widgets/quate_card.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [HexColor('#5D13E7'), HexColor('#8249B5')],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: QuateCard(
          quateContent: error,
          quateAuther: '',
          child: Text(
            'Reload Now',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
