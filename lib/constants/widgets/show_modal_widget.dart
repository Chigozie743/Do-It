import 'package:liberty_app/constants/utils/exports.dart';

class ShowModalWidget extends StatelessWidget {
  const ShowModalWidget({
    required this.headerText,
    required this.bodyWidget,
    super.key});

  final String headerText;
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Naira4YuanColors.n4YWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.sp),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////////////////////////////////////////////////////////////////////////
              /// PHASE 1: HEADER
              //////////////////////////////////////////////////////////////////////////
              Center(
                child: Image.asset(
                  DoItAssetsPath.dividerHandleIcon,
                  height: 6.sp,
                  width: 40.sp,
                ),
              ),
          
              Padding(
                padding: EdgeInsets.only(
                    left: 15.sp, right: 15.sp, top: 10.sp, bottom: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DoItText(
                      text: headerText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      textColor: DoItColors.blue,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        DoItAssetsPath.xIcon,
                        color: const Color(0xFF94A3B8),
                        height: 20.sp,
                        width: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
          
              Divider(
                color: DoItColors.grey,
                thickness: 1.5.sp,
              ),
          
              //////////////////////////////////////////////////////////////////////////
              /// PHASE 2: TEXT
              //////////////////////////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsets.only(
                    left: 15.sp, right: 15.sp, top: 10.sp, bottom: 5.sp),
                child: bodyWidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}