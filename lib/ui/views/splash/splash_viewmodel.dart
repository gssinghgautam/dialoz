import 'package:dailoz/app/app.locator.dart';
import 'package:dailoz/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();

  void navigateToLogin() async {
    await _navigator.navigateTo(Routes.loginView);
  }

  void navigateToSignUp() async {
    await _navigator.navigateTo(Routes.dashboardView);
  }
}
