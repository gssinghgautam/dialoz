import 'package:dailoz/app/app.locator.dart';
import 'package:dailoz/app/app.router.dart';
import 'package:dailoz/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  locator<NavigationService>().config(
    enableLog: true,
    defaultTransitionStyle: Transition.rightToLeftWithFade,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      theme: ThemeData(
          backgroundColor: kcBackgroundColor,
          canvasColor: kcBackgroundColor,
          useMaterial3: true,
          fontFamily: GoogleFonts.roboto().fontFamily,
          dividerColor: kcPrimaryHintColor,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
          )),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
