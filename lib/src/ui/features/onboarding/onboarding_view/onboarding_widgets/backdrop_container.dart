import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../generic/constants/decorations.dart';

class BackdropContainer extends StatelessWidget {
  const BackdropContainer({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Decorations.kBorderMargin,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withOpacity(0.5),
        borderRadius: BorderRadius.circular(
          Decorations.kWideButtonBorderRadius,
        ), // Adjust the opacity for translucency
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 1,
          sigmaY: 1,
        ), // Adjust the sigma values for the blur intensity

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
