import 'package:liberty_app/constants/utils/exports.dart';

  ///************ APP SNACK BAR FUNCTION *********/
  //************************************************************* */
  // App Snack Bar Function
  //************************************************************* */
  modalNotification(
      {required String message,
      required BuildContext context,
      required bool isError}) {
    AppSnackbar showToast =
        AppSnackbar(context, milliseconds: 1500, isError: isError);
    showToast.showToast(text: message);
  }

