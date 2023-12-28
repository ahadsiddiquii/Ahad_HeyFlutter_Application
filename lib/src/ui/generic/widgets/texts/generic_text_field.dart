import 'package:ahad_heyflutter_application/src/ui/generic/widgets/texts/generic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/decorations.dart';
import '../../constants/font_sizes.dart';
import '../../constants/theme_colors.dart';

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.keyboadType,
    this.inputFormatters,
    this.prefixIconImage,
    this.suffixIconImage,
    this.suffixIconOnTap,
    this.isPasswordField = false,
    this.isDescriptionField = false,
    required this.hintText,
    this.controller,
    this.onTap,
    this.readOnly,
    this.customPadding,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  final TextEditingController? controller;
  final String? prefixIconImage, suffixIconImage;
  final bool isPasswordField;
  final VoidCallback? onTap, suffixIconOnTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboadType;
  final bool isDescriptionField;
  final bool? readOnly;
  final EdgeInsets? customPadding;
  final TextCapitalization textCapitalization;
  final String hintText;

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  bool isOnChangedEnabled = false;

  bool isVisible = false;

  bool _getObscureText() {
    if (widget.isPasswordField) {
      if (isVisible) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Widget? _getSuffixIcon() {
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      if (widget.isPasswordField) {
        return InkWell(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Container(
            width: Decorations.kFieldIconWidth + 15,
            height: Decorations.kFieldIconHeight,
            padding: const EdgeInsets.symmetric(
              vertical: Decorations.kFieldIconVerticalPadding - 3,
              horizontal: Decorations.kFieldIconHorizontalPadding,
            ),
            child: GenericText(
              !isVisible ? 'View' : 'Hide',
              style: FontSizes.size16Regular(
                color: Colors.black,
              ),
            ),
          ),
          // Icon(
          //   isVisible
          //       ? Icons.visibility_off_outlined
          //       : Icons.visibility_outlined,
          //   color: ThemeColors.kButtonDarkBlueColor,
          //   size: Decorations.kFieldIconHeight + 2,
          // )),
        );
      }

      if (widget.suffixIconImage != null) {
        return InkWell(
          onTap: widget.suffixIconOnTap ??
              () {
                widget.controller!.clear();
                setState(() {});
              },
          child: Container(
            width: Decorations.kFieldIconWidth,
            height: Decorations.kFieldIconHeight,
            padding: const EdgeInsets.symmetric(
              vertical: Decorations.kFieldIconVerticalPadding - 3,
              horizontal: Decorations.kFieldIconHorizontalPadding,
            ),
            child: SvgPicture.asset(
              widget.suffixIconImage!,
            ),
          ),
        );
      }
    }

    return null;
  }

  bool _getReadOnly() {
    if (widget.readOnly != null && widget.readOnly!) {
      return true;
    }
    if (widget.onTap != null) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Decorations.kBorderMargin,
      child: TextFormField(
        obscureText: _getObscureText(),
        textCapitalization: widget.textCapitalization,
        controller: widget.controller,
        style: FontSizes.size14Light(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: _getSuffixIcon(),
          prefixIcon: widget.prefixIconImage != null
              ? Container(
                  width: Decorations.kFieldIconWidth,
                  height: Decorations.kFieldIconHeight,
                  padding: const EdgeInsets.symmetric(
                    vertical: Decorations.kFieldIconVerticalPadding,
                    horizontal: Decorations.kFieldIconHorizontalPadding,
                  ),
                  child: SvgPicture.asset(
                    widget.prefixIconImage!,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: FontSizes.size14Light(
            color: ThemeColors.kFontHintColor,
          ),
          isDense: true,
          contentPadding: widget.customPadding ??
              const EdgeInsets.symmetric(
                vertical: Decorations.kTextFieldVerticalContentPadding,
                horizontal: 20,
              ),
          enabledBorder: Decorations.fieldOutlineBorder,
          focusedBorder: Decorations.fieldOutlineBorder,
          errorBorder: Decorations.fieldOutlineBorder,
          focusedErrorBorder: Decorations.fieldOutlineBorder,
          disabledBorder: Decorations.fieldOutlineBorder,
          errorStyle: FontSizes.size14Light(
            color: ThemeColors.kErrorRedColor,
          ),
        ),
        onTap: widget.onTap,
        readOnly: _getReadOnly(),
        validator: widget.validator != null
            ? (val) {
                setState(() {
                  isOnChangedEnabled = true;
                });
                return widget.validator!(val);
              }
            : null,
        onChanged: (value) {
          setState(() {});

          if (isOnChangedEnabled) {
            widget.onChanged!(value);
          }
        },
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboadType,
        cursorColor: ThemeColors.kThemeColor,
        minLines: widget.isDescriptionField ? 6 : null,
        maxLines: widget.isDescriptionField ? null : 1,
      ),
    );
  }
}
