import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/datamodel/task/task_model.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:dailoz/helper/utils.dart';
import 'package:dailoz/ui/widgets/calendar_day_builder.dart';
import 'package:dailoz/ui/widgets/task_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'task_viewmodel.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
      viewModelBuilder: () => TaskViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xFFF6F6F6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/icon-curved-search.svg'),
                          horizontalSpaceRegular,
                          Text(
                            'Search for task',
                            style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: kcSearchBarHintColor,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/images/icon-bold-close-square.svg',
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                TableCalendar(
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.week,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  rowHeight: 100.0,
                  daysOfWeekVisible: false,
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      formatButtonShowsNext: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false),
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (context, dateTime) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isSameDay(model.selectedDay, dateTime)
                                ? 'Today'
                                : Jiffy(model.selectedDay).EEEE,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: kcTitleColor,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/icon-curved-calendar.svg',
                            ),
                            label: Text(
                              Jiffy(dateTime).MMM,
                              style: GoogleFonts.roboto(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: kcTitleColor,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    defaultBuilder: (context, day, dayTime) {
                      return CalendarDayBuilder(
                        day: day,
                        focusedDay: dayTime,
                        isSelected: isSameDay(day, model.focusedDay),
                      );
                    },
                    todayBuilder: (context, day, dayTime) {
                      return CalendarDayBuilder(
                        day: day,
                        focusedDay: dayTime,
                        isSelected: isSameDay(day, model.focusedDay),
                      );
                    },
                    selectedBuilder: (context, day, dayTime) {
                      return CalendarDayBuilder(
                        day: day,
                        focusedDay: dayTime,
                        isSelected: isSameDay(day, model.focusedDay),
                      );
                    },
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(model.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(model.selectedDay, selectedDay)) {
                      model.updateSelectedDay(selectedDay, focusedDay);
                    }
                  },
                  onFormatChanged: (format) {},
                  onPageChanged: (focusedDay) {},
                ),
                verticalSpaceMedium,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final time = model.timeSlots[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(time.format(context), style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                          color: kcPrimaryTextColor,
                        ),),
                        horizontalSpaceRegular,
                        Expanded(
                          child: SizedBox(
                            height: 150.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()
                              ),
                              itemBuilder: (context, index) {
                                final task = taskList[index];
                                return Padding(padding: const EdgeInsets.only(right: 16.0,), child: TaskItemView(
                                  title: task.title,
                                  timings: task.description,
                                  tags: task.tags,
                                  onTap: () {},
                                  borderColor: getTaskColor(task.type),
                                ),);
                              },
                              itemCount: taskList.length,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: model.timeSlots.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
