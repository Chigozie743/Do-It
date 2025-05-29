import 'package:liberty_app/constants/utils/exports.dart';


class DoItText extends StatelessWidget {
  final String? text;
  final bool? softWrap;
  final String? fontFamily;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? textColor;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  const DoItText({
    super.key,
    required this.text,
    this.height,
    this.softWrap,
    this.fontSize,
    this.textColor,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
    this.fontFamily = 'U8-Regular',
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      softWrap: softWrap ?? true,
      maxLines: maxLines ?? 10,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        height: height,
        fontFamily: fontFamily,
        fontSize: fontSize ?? 14.sp,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor ?? DoItColors.textGrey,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textColor ?? DoItColors.blue
      ),
    );
  }
}