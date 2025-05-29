import 'package:liberty_app/constants/utils/exports.dart';

class AnalytiticsWidgets extends StatelessWidget {
  const AnalytiticsWidgets({
    this.iconSize,
    required this.icon,
    required this.number,
    required this.title,
    required this.bigBoxColor,
    required this.smallBoxColor,
    super.key});

  final String title;
  final String number;
  final String icon;
  final double? iconSize;
  final Color bigBoxColor;
  final Color smallBoxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.sp,
      height: 138.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: bigBoxColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 35.sp,
                  height: 35.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: smallBoxColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      height: iconSize ?? 20.sp,
                      width: iconSize ?? 20.sp,
                    ),
                  ),
                ),

                DoItText(
                  text: number,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  textColor: DoItColors.black,
                ),
              ],
            ),

            DoItText(
              text: title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              textColor: DoItColors.black,
            ),
          ],
        ),
      ),
    );
  }
}