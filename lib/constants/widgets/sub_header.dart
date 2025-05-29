import 'package:liberty_app/constants/utils/exports.dart';

class SubHeaderWidget extends StatelessWidget {
  const SubHeaderWidget({
    required this.onTap,
    required this.leadText,
    required this.trailText,
    super.key});

  final String leadText;
  final String trailText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoItText(
          text: leadText,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          textColor: DoItColors.black,
        ),

        InkWell(
          onTap: () => onTap(),
          child: DoItText(
            text: trailText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            textColor: DoItColors.blue,
          ),
        ),
      ],
    );
  }
}