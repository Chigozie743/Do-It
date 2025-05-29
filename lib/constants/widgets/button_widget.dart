import 'package:liberty_app/constants/utils/exports.dart';
import 'package:liberty_app/constants/widgets/text.dart';


//////////////////////////////////////////////////////////////////////////
/// BUTTON WIDGET
/////////////////////////////////////////////////////////////////////////
class DoItButton extends StatelessWidget {
  const DoItButton(
      {required this.text,
      this.width,
      this.radius,
      this.height,
      this.padding,
      this.fontSize,
      this.textColor,
      this.textAlign,
      this.borderColor,
      this.backgroundColor,
      required this.onClick,
      super.key});

  final String text;
  final double? width;
  final double? radius;
  final double? height;
  final double? fontSize;
  final Color? textColor;
  final Color? borderColor;
  final Function onClick;
  final TextAlign? textAlign;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: height ?? 60.sp,
        width: width ?? 180.sp,
        decoration: BoxDecoration(
          color: backgroundColor ?? DoItColors.blue,
          border: Border.all(
              color: borderColor ?? DoItColors.transparentColor),
          borderRadius: BorderRadius.circular(radius ?? 10.sp),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.all(10.sp),
          child: Center(
            child: DoItText(
              text: text,
              fontSize: fontSize ?? 18.sp,
              textColor: textColor ?? DoItColors.white,
              fontWeight: FontWeight.w700,
              textAlign: textAlign ?? TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}


