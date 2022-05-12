import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTileWidget extends StatelessWidget {
  final String title;
  final int taskNumber;
  final Color textColor;
  final Color cardColor;
  final bool isIcon;
  final String iconPath;
  final Function()? onPressed;
  final double? opacity;

  const TaskTileWidget({
    Key? key,
    required this.title,
    required this.taskNumber,
    required this.textColor,
    required this.cardColor,
    this.isIcon = false,
    required this.iconPath,
    this.onPressed,
    this.opacity = 0.69,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(14.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cardColor, cardColor.withOpacity(opacity!)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          boxShadow: [
            BoxShadow(
              color: cardColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(2, 4),
            ),
            //you can set more BoxShadow() here
          ],
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isIcon ? SvgPicture.asset(iconPath) : Image.asset(iconPath),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: textColor,
              ),
            ),
            Text(
              '$taskNumber',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: textColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
