import 'package:dailoz/constants/app_colors.dart';
import 'package:dailoz/helper/ui_helper.dart';
import 'package:dailoz/ui/widgets/elevated_button_view.dart';
import 'package:dailoz/ui/widgets/text_button_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: screenWidth(context),
          padding: const EdgeInsets.only(left: 35.0, right: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/splash_logo.svg'),
              verticalSpaceLarge,
              RichText(
                text: TextSpan(
                  text: 'Dailoz',
                  style: GoogleFonts.roboto(
                    color: kcPrimaryTextColor,
                    fontSize: 40.0,
                  ),
                  children: const [
                    TextSpan(
                      text: '\u{002E}',
                      style: TextStyle(
                        color: kcOrangeColor,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceRegular,
              Text(
                'Plan what you will do to be more organized for today, tomorrow and beyond',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: kcPrimaryTextColor,
                  fontSize: 14.0,
                ),
              ),
              verticalSpaceLarge,
              ElevatedButtonView(
                title: 'Login',
                onPressed: model.navigateToLogin,
              ),
              verticalSpaceSmall,
              TextButtonView(
                title: 'Sign Up',
                onPressed: model.navigateToSignUp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
