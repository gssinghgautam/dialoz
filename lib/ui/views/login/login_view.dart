import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:dailoz/ui/views/login/login_view.form.dart';
import 'package:dailoz/ui/widgets/elevated_button_view.dart';
import 'package:dailoz/ui/widgets/form_field_view.dart';
import 'package:dailoz/ui/widgets/text_button_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(
      name: 'password',
      isPassword: true,
    )
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 36.0, right: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                Text(
                  'Login',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                    color: kcPrimaryTextColor,
                  ),
                ),
                verticalSpaceLarge,
                FormFieldView(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  iconPath: 'assets/images/email.svg',
                  hintText: 'Email ID or Username',
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                FormFieldView(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  iconPath: 'assets/images/password.svg',
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButtonView(
                      title: 'Forgot Password?',
                      onPressed: () {},
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    )
                  ],
                ),
                verticalSpaceMedium,
                ElevatedButtonView(
                  title: 'Login',
                  onPressed: () {},
                ),
                verticalSpaceLarge,
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: kcBorderColor,
                      ),
                    ),
                    horizontalSpaceRegular,
                    Text(
                      'or with',
                      style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        color: kcPrimaryHintColor,
                      ),
                    ),
                    horizontalSpaceRegular,
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: kcBorderColor,
                      ),
                    )
                  ],
                ),
                verticalSpaceLarge,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/images/google.svg'),
                      ),
                      onTap: () {},
                    ),
                    horizontalSpaceRegular,
                    InkWell(
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/images/facebook.svg'),
                      ),
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 100.0,
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
          child: TextButtonView(
            child: RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: kcPrimaryTextColor,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Sign Up',
                      style: GoogleFonts.roboto(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: kcPrimaryTextColor,
                      ),
                    ),
                  ]),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
