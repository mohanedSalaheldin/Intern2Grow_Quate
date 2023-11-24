import 'package:flutter/material.dart';

class SharedMethods {
  static BorderRadius choseBorderStyle(bool fullyRounded) {
    if (fullyRounded) {
      return const BorderRadius.only(
        topLeft: Radius.circular(
          7.0,
        ),
        topRight: Radius.circular(
          7.0,
        ),
        bottomRight: Radius.circular(
          7.0,
        ),
        bottomLeft: Radius.circular(
          7.0,
        ),
      );
    } else {
      return const BorderRadius.only(
        topLeft: Radius.circular(
          7.0,
        ),
        topRight: Radius.circular(
          7.0,
        ),
      );
    }
  }
}
