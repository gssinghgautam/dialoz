import 'package:dailoz/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldView extends StatefulWidget {
  final String iconPath;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isPassword;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function()? onEditingCompleted;
  final Function(String)? onSubmitted;

  const FormFieldView({
    Key? key,
    required this.iconPath,
    required this.hintText,
    this.controller,
    this.focusNode,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength,
    this.textInputAction,
    this.onChanged,
    this.onEditingCompleted,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<FormFieldView> createState() => _FormFieldViewState();
}

class _FormFieldViewState extends State<FormFieldView> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: SvgPicture.asset(widget.iconPath),
          onPressed: null,
        ),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: kcBorderColor, width: 1.0)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kcBorderColor, width: 1.0)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kcPrimaryColor, width: 1.0)),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 16.0,
          color: kcPrimaryHintColor,
        ),
        isDense: false,
      ),
      obscureText: widget.isPassword,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingCompleted,
      onSubmitted: widget.onSubmitted,
    );
  }
}
