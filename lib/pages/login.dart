import 'package:drive_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import '../constaints.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset(
            imagePath + 'bg_bezier_alt.svg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              top: 100,
              right: -24,
              child: SvgPicture.asset(
                imagePath + 'cloud_alt.svg',
                width: 115,
              )),
          Positioned(
              top: 20,
              left: 36,
              child: SvgPicture.asset(
                imagePath + 'cloud_alt.svg',
                width: 37,
              )),
          Positioned(
              top: 140,
              left: -6,
              child: SvgPicture.asset(
                imagePath + 'cloud_alt.svg',
                width: 37,
              )),
          Positioned(
              top: 46,
              right: MediaQuery.of(context).size.width * .35,
              child: SvgPicture.asset(
                imagePath + 'cloud_alt.svg',
                width: 37,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 100, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  imagePath + 'intro_alt.svg',
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome to',
                  style: TextStyle(
                      fontFamily: 'GilroyLight',
                      fontSize: 20,
                      color: blueTextColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Dribbox',
                  style: TextStyle(
                      fontFamily: 'GilroyBold',
                      fontSize: 38,
                      color: blueTextColor),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                      'Best cloud storage platform for all business and individuals to manage there data\n\nJoin For Free.',
                      style: TextStyle(
                          height: 1.54,
                          fontFamily: 'GilroyMedium',
                          fontSize: 14,
                          color: flueblueTextColor)),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 75) / 2,
                      height: 50,
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(imagePath + 'fingerprint_alt.svg'),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Smart Id',
                                style: TextStyle(
                                    fontFamily: 'GilroySemiBold',
                                    fontSize: 16,
                                    color: smartButtonText))
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: smartButtonText.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    mycontext: context,
                                  ))),
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 75) / 2,
                        height: 50,
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Sign in',
                                  style: TextStyle(
                                      fontFamily: 'GilroySemiBold',
                                      fontSize: 16,
                                      color: Colors.white)),
                              SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                  imagePath + 'right_arrow_alt.svg'),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: smartButtonText,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text('Use Social Login',
                        style: TextStyle(
                            fontFamily: 'GilroyRegular',
                            fontSize: 14,
                            color: footerText))),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(imagePath + 'instagram_alt.svg'),
                        SvgPicture.asset(imagePath + 'twitter_alt.svg'),
                        SvgPicture.asset(imagePath + 'facebook_alt.svg'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text('Create an account',
                        style: TextStyle(
                            fontFamily: 'GilroyRegular',
                            fontSize: 16,
                            color: footerText))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
