import 'package:liberty_app/constants/utils/exports.dart';

class TextFieldBox extends StatelessWidget {
  final String? hintText;
  final String? headText;
  final String? labelText;
  final String? headTrailText;
  final String? firstHeadTrailText;
  final double? height;
  final double? width;
  final double? hintFontSize;
  final double? borderRadius;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixColor;
  final Widget? prefixIcon;
  final bool? isCollapsed;
  final bool? readOnly;
  final bool? enabled;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Color? textColor;
  final Color? headTextColor;
  final Color? enabledColor;
  final Color? focusColor;
  final bool? filled;
  final Color? fillColor;
  final Color? hintColor;
  final int? maxLines;
  final int? maxLength;
  final bool? isCautioned;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final Function()? onIconPressed;
  final Function()? onTapHeadTrailText;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Color? prefixColor;
  final bool? autoCorrect;
  final bool? showHeader;
  final bool? enableSuggestion;
  final List<TextInputFormatter>? inputFormatters;
  final double? fontSize;
  final String fontFamily;
  final String autoFillHint;
  final InputBorder? borderType;
  final EdgeInsets? contentPadding;

  const TextFieldBox({
    super.key,
    this.autoFillHint = '',
    this.hintText,
    this.headText,
    this.labelText,
    this.borderType,
    this.headTrailText,
    this.firstHeadTrailText,
    this.height,
    this.width,
    this.onTap,
    this.controller,
    this.validator,
    this.textColor,
    this.hintFontSize,
    this.borderRadius,
    this.showHeader,
    this.textInputAction,
    this.focusColor,
    this.obscureText,
    this.enabledColor,
    this.suffixColor,
    this.prefixIcon,
    this.isCollapsed,
    this.onIconPressed,
    this.readOnly = false,
    this.enabled = true,
    this.onChanged,
    this.autoFocus,
    this.suffixIcon,
    this.hintStyle,
    this.filled,
    this.fillColor,
    this.maxLines,
    this.maxLength,
    this.focusNode,
    this.hintColor,
    this.isCautioned = true,
    this.onEditingComplete,
    this.onTapHeadTrailText,
    this.borderColor,
    this.keyboardType,
    this.prefixColor,
    this.autoCorrect,
    this.contentPadding,
    this.enableSuggestion,
    this.inputFormatters,
    this.fontSize,
    this.headTextColor,
    this.fontFamily = 'Grotesk',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader ?? true)
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DoItText(
                  text: headText!,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  textColor: headTextColor ?? DoItColors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 3.sp,
            ),
          ],
        ) else const SizedBox.shrink(),
        SizedBox(
          width: width ?? double.infinity,
          height: height ?? 60.sp,
          child: TextFormField(
            onTap: onTap,
            readOnly: readOnly ?? true,
            enabled: enabled ?? true,
            autofillHints: [autoFillHint],
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            autocorrect: autoCorrect ?? true,
            enableSuggestions: enableSuggestion ?? true,
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            style: TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 16.sp,
              color: textColor ?? DoItColors.textGrey,
              decoration: TextDecoration.none,
            ),
            obscureText: obscureText ?? false,
            obscuringCharacter: "*",
            cursorColor: DoItColors.grey,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(color: DoItColors.textGrey, fontSize: 16.sp),
              counter: const SizedBox.shrink(),
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(horizontal: 24.sp, vertical: 15.sp),
              suffixIcon: suffixIcon != null
                  ? GestureDetector(
                      onTap: onIconPressed,
                      child: suffixIcon,
                    )
                  : null,
              prefixIcon: prefixIcon,
              prefixIconColor: prefixColor,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              fillColor: fillColor ?? DoItColors.white,
              filled: filled ?? true,
              border: borderType ?? OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? DoItColors.grey,
                  width: 1.sp,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: borderType ?? OutlineInputBorder(
                borderSide: BorderSide(
                    color: enabledColor ?? DoItColors.grey,
                    width: 1.sp),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: borderType ?? OutlineInputBorder(
                borderSide: BorderSide(
                    color: focusColor ?? DoItColors.blue,
                    width: 1.sp),
                borderRadius: BorderRadius.circular(12.r),
              ),
              errorBorder: borderType ?? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              hintText: hintText,
              hintStyle: hintStyle ??
                  TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: hintFontSize ?? 16.sp,
                    color: hintColor ?? DoItColors.textGrey,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

