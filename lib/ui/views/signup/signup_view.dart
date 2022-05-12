import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:dailoz/ui/views/signup/signup_view.form.dart';
import 'package:dailoz/ui/widgets/elevated_button_view.dart';
import 'package:dailoz/ui/widgets/form_field_view.dart';
import 'package:dailoz/ui/widgets/text_button_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'signup_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password', isPassword: true)
])
class SignupView extends StatelessWidget with $SignupView {
  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      onModelReady: (model){
        listenToFormUpdated(model);
      },
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
                  'Sign Up',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 36.0,
                    color: kcPrimaryTextColor,
                  ),
                ),
                verticalSpaceLarge,
                FormFieldView(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  iconPath: 'assets/images/email.svg',
                  hintText: 'Name',
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                FormFieldView(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  iconPath: 'assets/images/email.svg',
                  hintText: 'Email',
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                FormFieldView(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  iconPath: 'assets/images/password.svg',
                  hintText: 'Password',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                ),
                verticalSpaceMedium,
                ElevatedButtonView(
                  title: 'CREATE',
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
                  text: 'Have any account?',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    color: kcPrimaryTextColor,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Sign In',
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
