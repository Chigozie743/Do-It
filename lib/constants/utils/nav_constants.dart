import 'package:liberty_app/constants/utils/exports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

////////////////////////////////////////////////////////////////////////////////////
// This is for smooth routing or transition. Rather than jumping, we made use of
// the PageTransition package.
////////////////////////////////////////////////////////////////////////////////////

void nextScreen(context, page) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}


///************** NAVIGATOR POP FUNCTION *********/
void nextPop(context, page) {
  Navigator.pop(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: page,
    ),
  );
}


///************** SHOW MODAL BOTTOM SHEET FUNCTION *********/
void handleBottomNav(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: DoItColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.r),
      )),
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

