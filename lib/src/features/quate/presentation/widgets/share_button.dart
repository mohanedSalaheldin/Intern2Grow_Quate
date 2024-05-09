import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareQuateButton extends StatelessWidget {
  const ShareQuateButton({
    super.key,
    required this.quate,
  });
  final String quate;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Share.share(quate);
        },
        icon: const Icon(Icons.share));
  }
}
