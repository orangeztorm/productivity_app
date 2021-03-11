import 'package:flutter/material.dart';
import 'package:productivity_app/components/hex_to_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen/login_screen.dart';
import 'onboarding_screen/onboarding_screen.dart';

import '../size_config.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(context,
    MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [hexToColor('#7625CF'), hexToColor('#9245E8')],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 70,
                child: Container(
                  width: getProportionateScreenWidth(164),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '90',
                            style: GoogleFonts.signika(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: getProportionateScreenHeight(6)),
                            child: Text(
                              'S',
                              style: GoogleFonts.signika(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                         SizedBox(width: getProportionateScreenWidth(10)),
                          Text(
                            'Prod',
                            style: GoogleFonts.signika(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(15)),
                      Text(
                        '90s Productivity App',
                        style: GoogleFonts.signika(
                            color: hexToColor('#C9A0F8'), fontSize: 12),
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                    height: getProportionateScreenHeight(501),
                    width: getProportionateScreenWidth(315),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/splash_girl.png'),
                      fit: BoxFit.fill,
                    ))))
          ],
        ),
      ),
    );
  }
}
