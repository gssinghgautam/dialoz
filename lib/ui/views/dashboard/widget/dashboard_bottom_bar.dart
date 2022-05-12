import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

class DashboardBottomBar extends ViewModelWidget<DashboardViewModel> {
  const DashboardBottomBar({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    if(kDebugMode){
      print('DashboardBottomBar');
    }
    return Container(
      margin: const EdgeInsets.only(left: 24.0,right: 24.0,bottom: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(2, 4),
          ),
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: NavigationBarTheme(
          data:
              const NavigationBarThemeData(indicatorColor: Colors.transparent),
          child: NavigationBar(
            height: 74.0,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            backgroundColor: kcBackgroundColor,
            onDestinationSelected: viewModel.setTabIndex,
            selectedIndex: viewModel.currentTabIndex,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset('assets/images/icon-home.svg'),
                selectedIcon: SvgPicture.asset(
                  'assets/images/icon-selected-home.svg',
                  color: kcPrimaryColor,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: SvgPicture.asset('assets/images/icon-document.svg'),
                selectedIcon: SvgPicture.asset(
                    'assets/images/icon-selected-document.svg'),
                label: 'Message',
              ),
              NavigationDestination(
                icon: SvgPicture.asset('assets/images/icon-activity.svg'),
                selectedIcon: SvgPicture.asset(
                    'assets/images/icon-selected-activity.svg'),
                label: 'Stats',
              ),
              NavigationDestination(
                icon: SvgPicture.asset('assets/images/icon-profile.svg'),
                selectedIcon:
                    SvgPicture.asset('assets/images/icon-selected-profile.svg'),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
