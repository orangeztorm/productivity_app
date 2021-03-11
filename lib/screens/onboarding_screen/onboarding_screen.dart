import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_screen/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      body: IntroductionScreenOnboading(),
    );
  }
}

class IntroductionScreenOnboading extends StatefulWidget {
  @override
  _IntroductionScreenOnboadingState createState() =>
      _IntroductionScreenOnboadingState();
}

class _IntroductionScreenOnboadingState
    extends State<IntroductionScreenOnboading> {
  final introKey = GlobalKey<IntroductionScreenState>();
  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset('assets/$assetName'),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => LoginScreen()),
        );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          titleWidget: Text(
            'Manage your time',
            style: GoogleFonts.signika(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          bodyWidget: Text(
            'Instead of burning yourself out be productive.',
            textAlign: TextAlign.center,
            style: GoogleFonts.signika(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          image: _buildImage('onbarding_1.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: Text(
            'Schedule your time',
            style: GoogleFonts.signika(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          bodyWidget: Text(
            'Continue with the app to be more productive.',
            textAlign: TextAlign.center,
            style: GoogleFonts.signika(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          image: _buildImage('onboarding2.svg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
