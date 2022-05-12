import 'package:dailoz/ui/views/dashboard/dashboard_view.dart';
import 'package:dailoz/ui/views/login/login_view.dart';
import 'package:dailoz/ui/views/signup/signup_view.dart';
import 'package:dailoz/ui/views/splash/splash_view.dart';
import 'package:dailoz/ui/views/welcome/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: WelcomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
  ],
  logger: StackedLogger(),
  locatorName: 'locator',
  locatorSetupName: 'setupLocator',
)
class App {}
