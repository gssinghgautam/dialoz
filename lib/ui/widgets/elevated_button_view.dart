import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ElevatedButtonView extends StatelessWidget {
  final String title;
  final Color? buttonColor;
  final bool? isBusy;
  final Function()? onPressed;

  const ElevatedButtonView({
    Key? key,
    required this.title,
    this.buttonColor = kcPrimaryColor,
    this.isBusy = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isBusy!
          ? const SizedBox(
              height: 24.0,
              width: 24.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              title,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        fixedSize: Size(screenWidth(context), 52.0),
      ),
    );
  }
}
