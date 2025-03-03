import 'package:to_do_list_app/constants.dart';
import 'package:to_do_list_app/core/utils/routes.dart';
import 'package:to_do_list_app/core/utils/shared_prefs.dart';

String checkAppFlow() {
  return SharedPrefs.getBool(isOnBoardingSeen)
      ? Routes.homeView
      : Routes.onboardingView;
}
