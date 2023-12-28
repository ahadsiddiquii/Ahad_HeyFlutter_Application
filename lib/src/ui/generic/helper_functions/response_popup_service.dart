import '../context/app_context.dart';
import '../message_indicators/snackbar.dart';

class ResponsePopUpService {
  ResponsePopUpService._();

  static void showFailedSnackBar() {
    appContext.runContextSafeFunction(() {
      CustomSnackBar.snackBarTrigger(
        context: appContext.getContext()!,
        message: 'Something went wrong please try again.',
      );
    });
  }
}
