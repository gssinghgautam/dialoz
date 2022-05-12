import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskItemView extends StatelessWidget {
  const TaskItemView({
    Key? key,
    required this.title,
    required this.timings,
    this.tags,
    this.onTap,
    this.titleColor = kcPrimaryTextColor,
    this.timingsColor = kcTaskTimeColor,
    this.borderColor = kcBlueBorderColor,
  }) : super(key: key);

  final String title;
  final String timings;
  final List<String>? tags;
  final Function()? onTap;
  final Color titleColor;
  final Color timingsColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFD),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50.0,
                    width: 2.0,
                    decoration: BoxDecoration(
                        color: borderColor,
                        borderRadius: BorderRadius.circular(1)),
                  ),
                  horizontalSpaceSmall,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: titleColor,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        timings,
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: timingsColor,
                        ),
                      ),
                      verticalSpaceMedium,
                      if (tags != null)
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 16.0,
                          children: tags!
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13.0, vertical: 8.0),
                                  decoration: BoxDecoration(
                                      color: borderColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(3.0)),
                                  child: Text(
                                    tag,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
                                      color: borderColor,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                    ],
                  )
                ],
              ),
              InkWell(
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: kcPrimaryTextColor,
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
