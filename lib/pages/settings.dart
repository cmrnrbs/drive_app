import 'package:drive_app/colors.dart';
import 'package:drive_app/customwidgets/SwitchButton.dart';
import 'package:drive_app/pages/changepassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constaints.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextStyle menuStyle = new TextStyle(
      fontFamily: 'GilroyMedium', fontSize: 16, color: footerText);

  TextStyle bottomMenuStyle =
      new TextStyle(fontFamily: 'GilroyBold', fontSize: 16, color: footerText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              'Settings',
              style: TextStyle(
                  fontFamily: 'GilroyBold', fontSize: 30, color: footerText),
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Add Account',
                    style: menuStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen()));
                      },
                      child: Text('Change Password', style: menuStyle)),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Change Language', style: menuStyle),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Upgrade Plan', style: menuStyle),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Multiple Account', style: menuStyle),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enable Sync',
                        style: bottomMenuStyle,
                      ),
                      SwitchButton()
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Enable 2 Step Verification',
                        style: bottomMenuStyle,
                      ),
                      SwitchButton()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
