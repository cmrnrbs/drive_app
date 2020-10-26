import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import '../constaints.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      imagePath + 'left_arrow_alt.svg',
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Change Password',
                  style: TextStyle(
                      fontFamily: 'GilroyBold',
                      fontSize: 30,
                      color: footerText),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height - 203,
                        child: ListView(
                          children: [
                            Text(
                              'Current Password',
                              style: TextStyle(
                                  fontFamily: 'GilroyMedium',
                                  fontSize: 16,
                                  color: footerText),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'New Password',
                              style: TextStyle(
                                  fontFamily: 'GilroyMedium',
                                  fontSize: 16,
                                  color: footerText),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Confirm new password',
                              style: TextStyle(
                                  fontFamily: 'GilroyMedium',
                                  fontSize: 16,
                                  color: footerText),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: borderColor),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 52,
              color: bottomColor,
            ),
          )
        ],
      ),
    );
  }
}
