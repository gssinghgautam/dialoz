import 'package:dailoz/ui/views/activity/activity_view.dart';
import 'package:dailoz/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:dailoz/ui/views/home/home_view.dart';
import 'package:dailoz/ui/views/profile/profile_view.dart';
import 'package:dailoz/ui/views/task/task_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';

class DashboardBodyWidget extends ViewModelWidget<DashboardViewModel> {
  DashboardBodyWidget({Key? key}) : super(key: key);

  final Map<int, Widget> _viewCache = <int, Widget>{};

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return PageTransitionSwitcher(
      duration: const Duration(microseconds: 300),
      reverse: viewModel.reverse,
      transitionBuilder: (child, primary, secondary) {
        return SharedAxisTransition(
          animation: primary,
          secondaryAnimation: secondary,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        );
      },
      child: getViewForIndex(viewModel.currentTabIndex),
    );
  }

  Widget getViewForIndex(int index) {
    if (!_viewCache.containsKey(index)) {
      switch (index) {
        case 0:
          _viewCache[index] = const HomeView();
          break;
        case 1:
          _viewCache[index] = const TaskView();
          break;
        case 2:
          _viewCache[index] = const ActivityView();
          break;
        case 3:
          _viewCache[index] = const ProfileView();
          break;
      }
    }
    return _viewCache[index]!;
  }
}
