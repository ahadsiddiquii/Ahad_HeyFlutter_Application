import 'package:flutter/material.dart';

import '../../constants/spaces.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    super.key,
    this.space,
  });
  final double? space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space ?? Spaces.defaultSpacingHorizontal,
    );
  }
}
