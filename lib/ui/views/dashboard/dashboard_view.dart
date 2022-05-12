import 'package:dailoz/ui/views/dashboard/widget/dashboard_body_widget.dart';
import 'package:dailoz/ui/views/dashboard/widget/dashboard_bottom_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('DashboardView');
    }
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: DashboardBodyWidget(),
          ),
          bottomNavigationBar: const DashboardBottomBar(),
        );
      },
    );
  }
}
