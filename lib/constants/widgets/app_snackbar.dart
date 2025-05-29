import 'package:liberty_app/constants/utils/exports.dart';


///Uses the [Fluttertoast] package
///to build a custom Toast widget
///according to design specification.
class AppSnackbar {
  final BuildContext context;
  final bool isError;
  final int? milliseconds;
  final double height;

  final FToast _fToast = FToast();

  AppSnackbar(
    this.context, {
    this.isError = false,
    this.milliseconds,
    this.height = 60,
  }) {
    _fToast.init(context);
  }
  void showToast({required String text}) {
    final Size size = MediaQuery.of(context).size;
    final Widget toastWidget = Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Container(
        width: 350.sp,
        height: height.sp,
        //margin: EdgeInsets.symmetric(horizontal: 5.sp),
        padding: EdgeInsets.fromLTRB(15.sp, 14.sp, 15.sp, 14.sp),
        decoration: BoxDecoration(
          color: isError ? DoItColors.red : DoItColors.green,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: DoItColors.white, width: 0.5.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 32.sp,
                  width: 32.sp,
                  decoration: BoxDecoration(
                    color: DoItColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      isError
                          ? DoItAssetsPath.dataBaseFailureIcon
                          : DoItAssetsPath.rocketSuccessIcon,
                      width: 18.sp,
                      height: 18.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.sp,
                ),
                SizedBox(
                  width: 230.sp,
                  child: DoItText(
                    text: text,
                    fontSize: 13.sp,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    textColor: isError
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            Icon(
              Icons.close_outlined,
              color: DoItColors.white,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );

    _fToast.showToast(
      child: toastWidget,
      toastDuration: Duration(milliseconds: milliseconds ?? 2000),
      gravity: ToastGravity.TOP,
      positionedToastBuilder: (context, child, _) => Positioned(
        top: size.height.sp * 0.05,
        // bottom: size.height.sp * 0.01,
        //left: size.width * 0.0628,
        child: Center(child: child),
      ),
    );
  }
}

class ShowToast {
  static void errorToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context, isError: true);
    toast.showToast(text: text);
  }

  static void successToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context);
    toast.showToast(text: text);
  }
}
