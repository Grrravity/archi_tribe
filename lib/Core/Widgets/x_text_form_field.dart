import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../theme/theme_color.dart';

class XTextFormField extends StatelessWidget {
  final Key? key;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final InputDecoration? inputDecoration;
  final double? borderRadiusValue;
  final EdgeInsets? contentPadding;
  final bool? enabled;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final TextInputType? keyboardType;
  final bool? isReadOnly;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final void Function()? onInputActionPressed;
  final void Function(String value)? onChanged;
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onFieldSumitted;

  const XTextFormField._({
    this.key,
    required this.textEditingController,
    this.onChanged,
    this.onSaved,
    this.hintText = '',
    this.labelText = '',
    this.initialValue = '',
    this.inputDecoration,
    this.borderRadiusValue = 8,
    this.contentPadding,
    this.enabled = true,
    this.prefixIcon,
    this.sufixIcon,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType = TextInputType.text,
    this.isReadOnly,
    this.textInputAction = TextInputAction.next,
    this.textStyle,
    this.onInputActionPressed,
    this.obscureText = false,
    this.maxLines = 1,
    this.validator,
    this.inputFormatters,
    this.onFieldSumitted,
  });

  factory XTextFormField.darkOutlined({
    Key? key,
    String? initialValue,
    String? hintText,
    String? labelText,
    required void Function(String value) onChanged,
    required TextEditingController textEditingController,
    double? borderRadiusValue,
    EdgeInsets? contentPadding,
    bool? enabled,
    Widget? prefixIcon,
    Widget? sufixIcon,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String? value)? validator,
    int? maxLines,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextStyle? textStyle,
    void Function()? onInputActionPressed,
    bool? obscureText,
    FocusNode? focusNode,
    void Function(String?)? onFieldSumitted,
  }) {
    return XTextFormField._(
      key: key,
      textEditingController: textEditingController,
      onChanged: onChanged,
      hintText: hintText,
      labelText: labelText,
      borderRadiusValue: borderRadiusValue,
      contentPadding: contentPadding,
      enabled: enabled ?? true,
      prefixIcon: prefixIcon,
      sufixIcon: sufixIcon,
      inputFormatters: inputFormatters,
      validator: validator,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textStyle: textStyle,
      onInputActionPressed: onInputActionPressed,
      obscureText: obscureText ?? false,
      onFieldSumitted: onFieldSumitted,
    );
  }

  factory XTextFormField.redOutlined({
    Key? key,
    String? initialValue,
    String? hintText,
    String? labelText,
    required void Function(String value) onChanged,
    required TextEditingController textEditingController,
    double? borderRadiusValue,
    EdgeInsets? contentPadding,
    bool? enabled,
    Widget? prefixIcon,
    Widget? sufixIcon,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String? value)? validator,
    int? maxLines,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextStyle? textStyle,
    void Function()? onInputActionPressed,
    bool? obscureText,
    FocusNode? focusNode,
    void Function(String?)? onFieldSumitted,
  }) {
    return XTextFormField._(
      key: key,
      textEditingController: textEditingController,
      onFieldSumitted: onFieldSumitted,
      onChanged: onChanged,
      hintText: hintText,
      labelText: labelText,
      borderRadiusValue: borderRadiusValue,
      contentPadding: contentPadding,
      enabled: enabled ?? true,
      prefixIcon: prefixIcon,
      sufixIcon: sufixIcon,
      inputFormatters: inputFormatters,
      validator: validator,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textStyle: textStyle ??
          Get.textTheme.bodyText1!.copyWith(color: Get.theme.errorColor),
      onInputActionPressed: onInputActionPressed,
      obscureText: obscureText ?? false,
      inputDecoration: InputDecoration(
        fillColor: (enabled ?? true)
            ? Colors.transparent
            : Get.theme.colorScheme.secondary.withOpacity(0.05),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(getBorderRadius(borderRadiusValue))),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.secondary.withOpacity(0.05),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(getBorderRadius(borderRadiusValue))),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(getBorderRadius(borderRadiusValue))),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(getBorderRadius(borderRadiusValue))),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(getBorderRadius(borderRadiusValue))),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
        alignLabelWithHint: true,
        contentPadding: getPadding(contentPadding),
        enabled: enabled ?? true,
        errorStyle:
            Get.textTheme.bodyText2!.copyWith(color: Get.theme.errorColor),
        hintText: hintText,
        hintStyle: Get.textTheme.bodyText2!.copyWith(
            color: (enabled ?? true) ? Get.theme.colorScheme.secondary : grey5),
        labelStyle: Get.textTheme.bodyText2!
            .copyWith(color: (enabled ?? true) ? primary : grey5),
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
      ),
    );
  }

  factory XTextFormField.roundedBorder({
    Key? key,
    String? initialValue,
    String? hintText,
    String? labelText,
    void Function(String? value)? onSaved,
    void Function(String value)? onChanged,
    TextEditingController? textEditingController,
    double? borderRadiusValue,
    EdgeInsets? contentPadding,
    bool? enabled,
    bool? readOnly,
    Widget? prefixIcon,
    Widget? sufixIcon,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String? value)? validator,
    int? maxLines,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextStyle? textStyle,
    void Function()? onInputActionPressed,
    bool? obscureText,
    FocusNode? focusNode,
    AutovalidateMode? autovalidateMode,
    void Function(String?)? onFieldSumitted,
  }) {
    return XTextFormField._(
      key: key,
      textEditingController: textEditingController,
      onFieldSumitted: onFieldSumitted,
      onChanged: onChanged,
      onSaved: onSaved,
      hintText: hintText,
      labelText: labelText,
      initialValue: initialValue,
      borderRadiusValue: borderRadiusValue,
      contentPadding: contentPadding,
      enabled: enabled ?? true,
      prefixIcon: prefixIcon,
      isReadOnly: readOnly,
      sufixIcon: sufixIcon,
      inputFormatters: inputFormatters,
      validator: validator,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      inputDecoration: InputDecoration(
        fillColor: readOnly ?? false ? Colors.transparent : null,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: readOnly ?? false ? grey3 : Colors.white),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
      textInputAction: textInputAction,
      textStyle: textStyle,
      onInputActionPressed: onInputActionPressed,
      obscureText: obscureText ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      initialValue: initialValue,
      onSaved: (s) {
        if (onSaved != null) {
          onSaved!(s);
        }
      },
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      cursorColor: Colors.black,
      cursorWidth: 1,
      decoration: getDecoration(),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onEditingComplete: () => getOnInputActionPressed(),
      style: getTextStyle(),
      obscureText: obscureText!,
      maxLines: maxLines,
      onFieldSubmitted: onFieldSumitted,
      readOnly: isReadOnly ?? false,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      validator: validator,
      inputFormatters: inputFormatters,
    );
  }

  void getOnInputActionPressed() {
    if (onInputActionPressed != null) {
      onInputActionPressed!();
    }
  }

  TextStyle getTextStyle() {
    return (enabled ?? true)
        ? textStyle ?? Get.textTheme.bodyText1!
        : Get.textTheme.bodyText1!.copyWith(color: grey5);
  }

  InputDecoration getDecoration() {
    return inputDecoration ??
        InputDecoration(
          fillColor: (enabled ?? true) ? Colors.transparent : grey1,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getBorderRadius(borderRadiusValue),
              ),
            ),
            borderSide: const BorderSide(
              color: grey1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getBorderRadius(borderRadiusValue),
              ),
            ),
            borderSide: const BorderSide(
              color: grey3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getBorderRadius(borderRadiusValue),
              ),
            ),
            borderSide: BorderSide(
              color: Get.theme.errorColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getBorderRadius(borderRadiusValue),
              ),
            ),
            borderSide: const BorderSide(
              color: black1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getBorderRadius(borderRadiusValue),
              ),
            ),
            borderSide: BorderSide(
              color: Get.theme.errorColor,
            ),
          ),
          alignLabelWithHint: true,
          contentPadding: getPadding(contentPadding),
          enabled: enabled!,
          errorStyle:
              Get.textTheme.bodyText2!.copyWith(color: Get.theme.errorColor),
          hintText: hintText,
          hintStyle: Get.textTheme.bodyText2!.copyWith(color: grey5),
          labelStyle: Get.textTheme.bodyText2!.copyWith(color: grey5),
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
        );
  }
}

EdgeInsets getPadding(EdgeInsets? contentPadding) {
  return contentPadding ??
      const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      );
}

double getBorderRadius(double? borderRadius) {
  return borderRadius ?? 8;
}
