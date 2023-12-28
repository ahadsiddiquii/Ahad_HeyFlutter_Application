// Flutter imports:
import 'package:flutter/material.dart';

class GenericText extends StatelessWidget {
  const GenericText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.forceStrutHeight = false,
    this.needsTranslation = true,
    this.softWrap,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool forceStrutHeight;
  final bool needsTranslation;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      strutStyle: StrutStyle(
        forceStrutHeight: forceStrutHeight && needsTranslation,
      ),
      style: style,
      softWrap: softWrap,
    );
  }
}
