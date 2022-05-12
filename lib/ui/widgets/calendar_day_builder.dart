import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CalendarDayBuilder extends StatelessWidget {
  final DateTime day;
  final DateTime focusedDay;
  final bool isSelected;

  const CalendarDayBuilder({
    Key? key,
    required this.day,
    required this.focusedDay,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: isSelected ? kcPrimaryColor : Colors.white,
      ),
      width: 90.0,
      height: 100.0,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),

      ///definition of content inside of calendar card
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat.E().format(day).toUpperCase(),
            style: GoogleFonts.roboto(
              fontSize: 15.0,
              color: isSelected ? Colors.white : kcCalendarTitleColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpaceSmall,
          Text(
            DateFormat("dd").format(day),
            style: GoogleFonts.roboto(
              fontSize: 14.0,
              color: isSelected ? Colors.white : kcCalendarTitleColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
