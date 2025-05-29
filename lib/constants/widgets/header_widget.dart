import 'package:liberty_app/constants/utils/exports.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    this.showBody = false,
    required this.headText,
    this.secondBodyText,
    this.thirdBodyText,
    this.firstBodyText,
    this.onBackTap,
    this.width,
    super.key});

  final String headText;
  final String? firstBodyText;
  final String? thirdBodyText;
  final String? secondBodyText;
  final bool? showBody;
  final double? width;
  final Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onBackTap != null ? onBackTap!() : Navigator.pop(context);
          },
          child: Container(
            width: 50.sp,
            height: 50.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: DoItColors.grey, width: 0.5.sp),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: DoItColors.black,
                size: 22.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.sp,),

        SizedBox(
          width: width ?? 150.sp,
          child: DoItText(
            text: headText,
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
            textColor: DoItColors.black,
          ),
        ),
        if(showBody == true) ...[
          SizedBox(height: 10.sp,),

          SizedBox(
            width: 250.sp,
            child: Text.rich(
              TextSpan(
                text: firstBodyText ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: DoItColors.black,
                  letterSpacing: 0.2.sp,
                  fontFamily: 'U8-Regular',
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: secondBodyText ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: DoItColors.blue,
                      letterSpacing: 0.2.sp,
                      fontFamily: 'U8-Regular',
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {}
                  ),
                  
                  TextSpan(
                    text: thirdBodyText ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: DoItColors.black,
                      letterSpacing: 0.2.sp,
                      fontFamily: 'U8-Regular',
                    ),
                  ),
                ],
              ),
            ),
          )
        ] else ...[const SizedBox.shrink()],
      ],
    );
  }
}



///////////////////////////////////////////////////////////
/// HOME HEADER WIDGET
//////////////////////////////////////////////////////////
class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    required this.name,
    required this.onNotificationTap,
    super.key});

  final String name;
  final Function() onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoItText(
              text: 'Hi $name',
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
              textColor: DoItColors.black,
            ),
            DoItText(
              text: 'Welcome onboard',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              textColor: DoItColors.blue,
            ),
          ],
        ),

        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            InkWell(
              onTap: () => onNotificationTap(),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFECF1FF),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: SvgPicture.asset(
                    DoItAssetsPath.bellIcon,
                    height: 26.sp,
                    width: 26.sp,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 7.sp,
              right: 10.sp,
              child: Container(
                width: 6.sp,
                height: 6.sp,
                decoration: BoxDecoration(
                  color: DoItColors.red,
                  shape: BoxShape.circle
                )
              ),
            )
          ],
        ),
      ],
    );
  }
}