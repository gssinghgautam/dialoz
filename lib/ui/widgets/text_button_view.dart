import 'package:dailoz/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButtonView extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final Function()? onPressed;
  final FontWeight fontWeight;
  final double fontSize;
  final Widget? child;

  const TextButtonView({
    Key? key,
    this.title,
    this.child,
    this.textColor = kcPrimaryTextColor,
    this.onPressed,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: title != null
          ? Text(
              title!,
              style: GoogleFonts.roboto(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            )
          : child!,
    );
  }
}
