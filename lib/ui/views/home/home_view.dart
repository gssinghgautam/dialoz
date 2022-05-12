import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/datamodel/task/task_model.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:dailoz/helper/utils.dart';
import 'package:dailoz/ui/widgets/task_item_view.dart';
import 'package:dailoz/ui/widgets/task_tile_widget.dart';
import 'package:dailoz/ui/widgets/text_button_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Steven',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: kcTitleColor,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        'Let\'s make this day productive',
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: kcDarkGreyColor,
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: Image.asset(
                      'assets/images/profile_icon.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                ],
              ),
              verticalSpaceLarge,
              Text(
                'My Task',
                style: GoogleFonts.roboto(
                  color: kcTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              verticalSpaceMedium,
              StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: TaskTileWidget(
                      iconPath: 'assets/images/computer.png',
                      title: 'Completed',
                      taskNumber: 86,
                      isIcon: false,
                      opacity: 0.69,
                      textColor: kcTitleColor,
                      cardColor: kcSkyBlueColor,
                      onPressed: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 0.8,
                    child: TaskTileWidget(
                      iconPath: 'assets/images/time-square-icon.svg',
                      title: 'Pending',
                      taskNumber: 15,
                      isIcon: true,
                      opacity: 0.74,
                      textColor: Colors.white,
                      cardColor: kcBlueColor,
                      onPressed: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: TaskTileWidget(
                      iconPath: 'assets/images/ongoing_folder.png',
                      title: 'On Going',
                      taskNumber: 67,
                      opacity: 0.35,
                      isIcon: false,
                      textColor: kcTitleColor,
                      cardColor: kcGreenColor,
                      onPressed: () {},
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 0.8,
                    child: TaskTileWidget(
                      iconPath: 'assets/images/close-square-icon.svg',
                      title: 'Cancelled',
                      taskNumber: 15,
                      isIcon: true,
                      opacity: 0.71,
                      textColor: Colors.white,
                      cardColor: kcRedColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              verticalSpaceLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Today Task',
                    style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: kcTitleColor,
                    ),
                  ),
                  TextButtonView(
                    title: 'View',
                    onPressed: () {},
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                  ),
                ],
              ),
              verticalSpaceRegular,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final task = taskList[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16.0,
                    ),
                    child: TaskItemView(
                      title: task.title,
                      timings: task.description,
                      tags: task.tags,
                      onTap: () {},
                      borderColor: getTaskColor(task.type),
                    ),
                  );
                },
                itemCount: taskList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
